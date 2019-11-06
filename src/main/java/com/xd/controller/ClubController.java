package com.xd.controller;

import com.xd.pojo.Club;
import com.xd.pojo.Type;
import com.xd.service.ClubService;
import com.xd.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.MalformedParameterizedTypeException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClubController {

	@Autowired //由spring自动为属性赋值
	private TypeService typeService;
	@Autowired  
	private ClubService clubService;
	
	/**1.查询所有俱乐部信息*/
	@RequestMapping(value = "/findAll")
	public String clubFind(Model model) {
		List<Club> clubList=clubService.findAll();
		model.addAttribute("list", clubList);
		return "club_list";
	}
	/**2.根据id删除俱乐部信息*/
	@RequestMapping("/clubDelete")
	public String clubDelete(Integer id) {
		int rows=clubService.deleteById(id);
		return "redirect:/findAll";
	}
	@RequestMapping("/add")
	public String clubAdds() {
		return "club_add";
	}
	/**3.添加俱乐部信息*/
	@RequestMapping("/clubAdd")
	public String clubAdd(Club club) {
		clubService.addClub(club);
		return "redirect:/findAll";
	}	
	/**4.1先根据id查询当前俱乐部的信息*/
	@RequestMapping("/clubInfo")
	public String clubInfo(Integer id,Model model) {
		Club club=clubService.findById(id);
		model.addAttribute("club", club);
		List<Type> list=typeService.findAll();
		model.addAttribute("list", list);
		return "club_update";
	}
	 
	/**4.2再根据id修改当前俱乐部的信息*/
	@RequestMapping("/clubUpdate")
	public String clubUpdate(Club club) {
		clubService.updateById(club);
		return "redirect:/findAll";
	}
	@RequestMapping("/ValidateName")
    @ResponseBody
    public Map validatorName(String name) {
        String[] Names = clubService.findClubName();
        System.out.println(Names);
        Map<String, Boolean> map = new HashMap<>(2);
        for (String s : Names) {
            if (s.equals(name)) {
                map.put("flag", false);
                return map;
            }
        }
        map.put("flag", true);
        return map;
    }
	/* 自定义日期转换格式 */
	@InitBinder
	public void InitBinder (ServletRequestDataBinder binder){
		binder.registerCustomEditor(java.util.Date.class, 
			new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)
		);
	}

}
