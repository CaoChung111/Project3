package com.javaweb.service.impl;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AssignmentBuildingServiceImpl implements IAssignmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Override
    public void deleteByBuildingsIn(List<Long> ids) {

    }

    @Override
    public void addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        for(Long it : staffIds){
            AssignBuildingEntity assignBuildingEntity = new AssignBuildingEntity();
            assignBuildingEntity.setBuildingEntity(buildingEntity);

            UserEntity userEntity = userRepository.findById(it).get();
            assignBuildingEntity.setUserEntity(userEntity);
            assignmentBuildingRepository.save(assignBuildingEntity);

        }
    }
}
