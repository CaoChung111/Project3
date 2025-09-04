package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.staffList(id);
        return result;
    }

    @PostMapping
    public BuildingEntity addOrUpdateBuilding(@RequestBody BuildingEntity building){
        return buildingService.addOrUpdateBuilding(building);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids){
    }
}
