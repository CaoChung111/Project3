package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@RestController("buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IAssignmentBuildingService assignmentBuildingService;

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.staffList(id);
        return result;
    }

    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@RequestBody BuildingDTO building){
        return ResponseEntity.ok(buildingService.addOrUpdateBuilding(building));
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable Long[] ids){
        List<Long> listId = Arrays.asList(ids);
        buildingService.deleteBuilding(listId);
    }

    @PutMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignmentBuildingService.addAssignmentBuildingEntity(assignmentBuildingDTO);
    }
}
