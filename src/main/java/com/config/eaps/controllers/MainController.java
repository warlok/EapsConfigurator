package com.config.eaps.controllers;

import com.config.eaps.objects.Eaps;
import com.config.eaps.objects.Vlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by dean on 10/16/15.
 */
@Controller
@RequestMapping("/")
public class MainController {

    Map<String,Eaps> eapsesMap= new HashMap<>();

    @RequestMapping(method = RequestMethod.GET)
    public String mainPage(ModelMap model, HttpServletRequest request) {
        model.addAttribute("eapsList", eapsesMap.values());
        return "index";
    }

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public String delVlans(ModelMap model, HttpServletRequest request) {
        return "conf";
    }

    @RequestMapping(value = "/conf", method = RequestMethod.POST)
    public String configureEapses(ModelMap model, HttpServletRequest request) {
        List<Vlan> vlans = new ArrayList<>();
        List<Eaps> eapses = new ArrayList();
        Enumeration parameterList = request.getParameterNames();
        while (parameterList.hasMoreElements()) {
            String value = parameterList.nextElement().toString();
            if (value.contains("vlan_name")) {
                Vlan vlan = new Vlan(request.getParameter(value));
                vlans.add(value.indexOf(value.length()-1),vlan);
            } else if (value.contains("vlan_number")) {
                Vlan vlan = vlans.get(value.indexOf(value.length()-1));
                vlan.setVlanID(Integer.parseInt(request.getParameter(value)));
            } else if (value.contains("EAPS_name")) {
                Eaps eaps= eapsesMap.get(request.getParameter(value));
                eapses.add(value.indexOf(value.length() - 1),eaps);
            } else if (value.contains("node_title")) {
                Eaps eaps = eapses.get(value.indexOf(value.length()-1));
                eaps.setMaster(request.getParameter(value));
            }
        }
        return "conf";
    }

    @RequestMapping(value = "/eapses", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody Collection<Eaps> retreiveEapsInformation() {
        return eapsesMap.values();
    }

}
