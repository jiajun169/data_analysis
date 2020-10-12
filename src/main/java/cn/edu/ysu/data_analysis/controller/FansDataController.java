package cn.edu.ysu.data_analysis.controller;

import cn.edu.ysu.data_analysis.bean.Fans;
import cn.edu.ysu.data_analysis.mapper.FansMapper;
import cn.edu.ysu.data_analysis.service.FansService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/fans")
public class FansDataController {
    @Autowired
    private FansService fansService;

    @RequestMapping("/geo")
    public String geo() {
        List<Fans> fans = fansService.findGeo();
        Map<String, Integer> geo_data = new HashMap<>();
        for (Fans fan : fans) {
            if (fan != null) {
                String location = fan.getLocation();
                if (!"其他".equals(location)) {
                    Integer cnt = geo_data.get(location);
                    geo_data.put(location, cnt == null ? 1 : cnt + 1);
                }
            }
        }
        Map<String, Integer> sortedData = new LinkedHashMap<>();
        geo_data.entrySet().stream().sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .forEach(e -> sortedData.put(e.getKey(), e.getValue()));
        return JSONObject.toJSONString(sortedData);
    }

    @RequestMapping("/gender")
    public String gender() {
        List<Fans> fans = fansService.findGender();
        Map<String, Integer> gender_data = new HashMap<>();
        gender_data.put("男", 0);
        gender_data.put("女", 0);
        for (Fans fan : fans) {
            if (fan != null) {
                String fan_gender = fan.getGender();
                if ("男".equals(fan_gender))
                    gender_data.put("男", gender_data.get("男") + 1);
                if ("女".equals(fan_gender))
                    gender_data.put("女", gender_data.get("女") + 1);
            }
        }
        return JSONObject.toJSONString(gender_data);
    }
    @RequestMapping("/list")
    public ModelAndView fansinfo() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("fansinfo");
        return mv;
    }
}
