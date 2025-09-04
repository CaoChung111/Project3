package com.javaweb.controller.admin;



import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private BuildingRepository buildingRepository;

    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        List<BuildingSearchResponse> buildingSearchResponseList = buildingService.findBuilding(buildingSearchRequest);
        mav.addObject("buildingList", buildingSearchResponseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        return mav;
    }

    @GetMapping(value="/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        return mav;
    }

    @GetMapping(value="/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingEntity buildingEntity= buildingRepository.findBuildingEntityById(id);
        mav.addObject("buildingEdit", buildingEntity);
        mav.addObject("listDistrict", District.type());
        mav.addObject("listTypeCode", TypeCode.type());
        return mav;
    }
}
