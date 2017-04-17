
package controller;

import entity.RoomEntity;
import entity.RoomServicesEntity;
import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import repository.RoomRepository;
import repository.RoomServicesRepository;
import repository.RoomTypeRepository;

@Controller
@RequestMapping(value="/")
public class PageController {
    @Autowired
    RoomRepository roomRepo;
    
    @Autowired
    RoomServicesRepository roomServicesRepo;
    
    @Autowired
    RoomTypeRepository roomTypeRepo;
    
    @RequestMapping(value="/",method = GET)
    public String showHomePage(Model model){
        
        return "index";
    }
    @RequestMapping(value="room", method = GET)
    public String viewRoom(Model model){
        List<RoomTypeEntity> roomType = 
                (List<RoomTypeEntity>) roomTypeRepo.findAll();
        
        model.addAttribute("roomTypeList", roomType);
        model.addAttribute("action","roomView");
        return "room";
    }
}
