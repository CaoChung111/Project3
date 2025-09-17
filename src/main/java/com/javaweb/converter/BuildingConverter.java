package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.utils.MapUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    public BuildingSearchResponse convertToSearchResponse(BuildingEntity buildingEntity){
        BuildingSearchResponse buildingSearchResponse= modelMapper.map(buildingEntity, BuildingSearchResponse.class);

        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
        String rentArea=rentAreaEntities.stream().map(it-> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingSearchResponse.setRentArea(rentArea);

        Map<String, String> district= District.type();
        String districtName="";
        if(buildingEntity.getDistrict()!=null && buildingEntity.getDistrict()!=""){
            districtName = district.get(buildingEntity.getDistrict());
        }
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtName);

        return buildingSearchResponse;
    }

    public BuildingEntity convertToBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        if(buildingDTO.getTypeCode()!=null && !buildingDTO.getTypeCode().isEmpty()){
            buildingEntity.setTypeCode(buildingDTO.getTypeCode().stream().collect(Collectors.joining(",")));
        }
        return buildingEntity;
    }

    public BuildingDTO convertToBuildingDTO(BuildingEntity buildingEntity){
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);

        String[] typeCode = buildingEntity.getTypeCode().split(",");
        List<String> listTypeCode = Arrays.asList(typeCode);
        buildingDTO.setTypeCode(listTypeCode);

        String rentAreas = rentAreaRepository.findByBuildingId(buildingDTO.getId()).stream().map(it->it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(rentAreas);

        return buildingDTO;
    }

    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder builingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(buildingSearchRequest.getName(), String.class))
                .setFloorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class))
                .setWard(MapUtils.getObject(buildingSearchRequest.getWard(), String.class))
                .setStreet(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class))
                .setDistrictId(MapUtils.getObject(buildingSearchRequest.getDistrict(), Long.class))
                .setNumberOfBasement(MapUtils.getObject(buildingSearchRequest.getTypeCode(), Long.class))
                .setManagerName(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                .setManagerPhoneNumber(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                .setRentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class))
                .setRentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class))
                .setRentAreaFrom(MapUtils.getObject(buildingSearchRequest.getAreaFrom(), Long.class))
                .setRentAreaTo(MapUtils.getObject(buildingSearchRequest.getAreaTo(), Long.class))
                .setStaffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Long.class)).build();
        return builingSearchBuilder;
    }
}
