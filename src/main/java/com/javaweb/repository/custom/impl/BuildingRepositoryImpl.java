package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(StringBuilder sql, BuildingSearchBuilder buildingSearchBuilder){
        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ab ON b.id = ab.buildingid ");
        }
    }

    public void queryNormal(StringBuilder sql, BuildingSearchBuilder buildingSearchBuilder){
        try{
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field it : fields){
                it.setAccessible(true);
                String fieldName = it.getName();
                if(!fieldName.equals("staffid") && ! fieldName.equals("typeCode") && !fieldName.startsWith("rent")){
                    Object valueObj = it.get(buildingSearchBuilder);
                    if(valueObj != null){
                        String value  = valueObj.toString();
                        if(StringUtils.check(value)){
                            if (NumberUtils.isLong(value)){
                                sql.append(" AND b."+fieldName+" = "+value+" ");
                            }else {
                                sql.append(" AND b."+ fieldName +" LIKE '%"+value+"%' ");
                            }
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void querySpecial(StringBuilder sql, BuildingSearchBuilder buildingSearchBuilder){
        Long staffid = buildingSearchBuilder.getStaffId();
        if(staffid != null){
            sql.append(" AND ab.staffid = "+ staffid+" ");
        }

        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if(typeCode !=null && typeCode.size()!=0){
            sql.append(" AND( ");
            sql.append(typeCode.stream().map(it-> " b.type LIKE '%"+ it+"%' ").collect(Collectors.joining(" OR ")));
            sql.append(") ");
        }

        Long rentAreaFrom= buildingSearchBuilder.getRentAreaFrom();
        Long rentAreaTo= buildingSearchBuilder.getRentAreaTo();
        if(rentAreaFrom!=null && rentAreaTo!=null){
            sql.append(" AND EXISTS (SELECT * FROM rentarea ra WHERE b.id= ra.buildingid ");
            if(rentAreaFrom !=null){
                sql.append(" AND ra.value >= "+ rentAreaFrom);
            }if(rentAreaTo !=null){
                sql.append(" AND ra.value <= "+ rentAreaTo);
            }
            sql.append(") ");
        }

        Long rentPriceFrom= buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        if (rentPriceFrom != null) {
            sql.append(" AND b.rentprice >= " + rentPriceFrom);
        }
        if (rentPriceTo != null) {
            sql.append(" AND b.rentprice <= " + rentPriceTo);
        }
    }
    @Override
    public List<BuildingEntity> findBuilding(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new  StringBuilder("SELECT b.* FROM building b ");
        joinTable(sql, buildingSearchBuilder);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(where, buildingSearchBuilder);
        querySpecial(where, buildingSearchBuilder);
        where.append(" GROUP BY b.id");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}
