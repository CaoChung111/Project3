package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private BuildingRepository buildingRepository;

    @Override
    public void UpdateRentAreaOfBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
        rentAreaRepository.deleteByBuilding(buildingEntity);

        String[] rentAreas = buildingDTO.getRentArea().split(",");

        for(String value : rentAreas){
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            BuildingEntity building = new BuildingEntity();
            building.setId(buildingDTO.getId());
            rentAreaEntity.setBuilding(building);
            rentAreaEntity.setValue(Long.valueOf(value.trim()));
            rentAreaRepository.save(rentAreaEntity);
        }
    }


}
