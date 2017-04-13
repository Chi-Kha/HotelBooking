package controller;

import entity.RoomEntity;
import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import repository.RoomRepository;
import repository.RoomServicesRepository;
import repository.RoomTypeRepository;

@Controller
@RequestMapping(value="/")
public class HotelController {
    @Autowired
    RoomRepository roomRepo;
    
    @Autowired
    RoomServicesRepository roomServicesRepo;
    
    @Autowired
    RoomTypeRepository roomTypeRepo;
    
    @RequestMapping(method = GET)
    public String showHomePage(Model model){
        return "home";
    }
    
    @RequestMapping(value="admin", method = GET)
    public String showAdminPage(Model model){
        return "admin/functions";
    }
    
    //RoomType
    
    @RequestMapping(value="admin/roomType", method = GET)
    public String showRoomTypes(Model model){
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("roomTypeList", roomTypeList);
        return "admin/roomType";
    }
    
    @RequestMapping(value="admin/addRoomType", method=GET)
    public String addRoomType(Model model){
        String action="addRoomType";
        model.addAttribute("roomType", new RoomTypeEntity());
        model.addAttribute("action", action);
        return "admin/addRoomType";
    }
    
    @RequestMapping(value="admin/addRoomType", method=POST)
    public String saveRoomType(RoomTypeEntity roomType){
        roomTypeRepo.save(roomType);
        return "redirect:/admin";
    }
    
    @RequestMapping(value="admin/delete/{roomTypeID}", method=GET)
    public String deleteRoomType(@PathVariable("roomTypeID") int roomTypeID){
        roomTypeRepo.delete(roomTypeID);
        return "redirect:/admin/roomType";
    }
    
    @RequestMapping(value="admin/edit/{roomTypeID}", method=GET)
    public String editRoomType(@PathVariable("roomTypeID") int roomTypeID, Model model){
        RoomTypeEntity roomType = roomTypeRepo.findOne(roomTypeID);
        String action="updateRoomType";
        model.addAttribute("roomType", roomType);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/addRoomType";
    }
    
    @RequestMapping(value="admin/updateRoomType", method=POST)
    public String updateRoomType(RoomTypeEntity roomType){
        roomTypeRepo.save(roomType);
        return "redirect:/admin";
    }
    
    //Room
    
    @RequestMapping(value="admin/room", method = GET)
    public String showRooms(Model model){
        List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findAll();
        model.addAttribute("roomTypeList", roomList);
        return "admin/room";
    }
    
    @RequestMapping(value="admin/addRoom", method=GET)
    public String addRoom(Model model){
        String action="addRoom";
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("room", new RoomEntity());
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("action", action);
        return "admin/addRoom";
    }
    
    @RequestMapping(value="admin/addRoom", method=POST)
    public String saveRoom(RoomEntity room){
        RoomTypeEntity roomType = roomTypeRepo.findOne(room.getRoomType().getRoomTypeID());
        room.setRoomType(roomType);
        roomRepo.save(room);
        return "redirect:/admin";
    }
    
    @RequestMapping(value="admin/delete/{roomID}", method=GET)
    public String deleteRoom(@PathVariable("roomID") int roomID){
        roomTypeRepo.delete(roomID);
        return "redirect:/admin/room";
    }
    
    @RequestMapping(value="admin/edit/{roomID}", method=GET)
    public String editRoom(@PathVariable("roomID") int roomID, Model model){
        RoomEntity room = roomRepo.findOne(roomID);
        String action="updateRoom";
        model.addAttribute("room", room);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/addRoom";
    }
    
    @RequestMapping(value="admin/updateRoom", method=POST)
    public String updateRoom(RoomTypeEntity room){
        roomTypeRepo.save(room);
        return "redirect:/admin";
    }
    
}
