package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findBuilding(buildingSearchRequest);
        List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
        for(BuildingEntity it : buildingEntities){
            BuildingSearchResponse buildingSearchResponse = buildingConverter.convertToSearchResponse(it);
            buildingSearchResponses.add(buildingSearchResponse);
        }
        return buildingSearchResponses;
    }

    public BuildingEntity addOrUpdateBuilding(BuildingEntity buildingEntity){
        return buildingRepository.save(buildingEntity);
    }

    @Override
    public ResponseDTO staffList(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<AssignBuildingEntity> assignmentBuilding= building.getAssignBuildingEntities();
        List<StaffResponseDTO> staffResponseDTOS= new ArrayList<>();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(it.getId());
            staffResponseDTO.setFullName(it.getFullName());
            boolean isAssigned = assignmentBuilding.stream()
                    .anyMatch(as -> as.getUserEntity().getId().equals(it.getId()));

            if(isAssigned){
                staffResponseDTO.setChecked("checked");
            }else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        ResponseDTO response = new ResponseDTO();
        response.setData(staffResponseDTOS);
        response.setMessage("Success");
        response.setDetail("200");
        return response;
    }
}
