package com.javaweb.repository;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignBuildingEntity, Long> {
    void deleteByBuildingEntityIdIn(List<Long> ids);

    void deleteByBuildingEntity(BuildingEntity building);

}
