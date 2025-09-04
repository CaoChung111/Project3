package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse convertToSearchResponse(BuildingEntity buildingEntity){
        BuildingSearchResponse buildingSearchResponse= modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        return buildingSearchResponse;
    }
}
