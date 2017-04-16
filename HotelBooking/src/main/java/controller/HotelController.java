package controller;

import entity.PromotionEntity;
import entity.RoomEntity;
import entity.RoomServicesEntity;
import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import repository.PromotionDetailRepository;
import repository.PromotionRepository;
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
    
    @Autowired
    PromotionRepository promotionRepo;
    
    @Autowired
    PromotionDetailRepository promotionDetailRepo;
    
    
    
    @RequestMapping(method = GET)
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
    
    
    
    
    //-------------------------------//
    //Admin Home
    
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
    
    @RequestMapping(value="admin/deleteRoomType/{roomTypeID}", method=GET)
    public String deleteRoomType(@PathVariable("roomTypeID") int roomTypeID){
        roomTypeRepo.delete(roomTypeID);
        return "redirect:/admin/roomType";
    }
    
    @RequestMapping(value="admin/editRoomType/{roomTypeID}", method=GET)
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
        model.addAttribute("roomList", roomList);
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
    
    @RequestMapping(value="admin/deleteRoom/{roomID}", method=GET)
    public String deleteRoom(@PathVariable("roomID") int roomID){
        roomRepo.delete(roomID);
        return "redirect:/admin/room";
    }
    
    @RequestMapping(value="admin/editRoom/{roomID}", method=GET)
    public String editRoom(@PathVariable("roomID") int roomID, Model model){
        RoomEntity room = roomRepo.findOne(roomID);
        String action="updateRoom";
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("room", room);
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/addRoom";
    }
    
    @RequestMapping(value="admin/updateRoom", method=POST)
    public String updateRoom(RoomEntity room){
        RoomTypeEntity roomType = roomTypeRepo.findOne(room.getRoomType().getRoomTypeID());
        room.setRoomType(roomType);
        roomRepo.save(room);
        return "redirect:/admin";
    }
    
    //RoomService
    
    @RequestMapping(value="admin/roomService", method = GET)
    public String showRoomServices(Model model){
        List<RoomServicesEntity> roomServiceList = (List<RoomServicesEntity>) roomServicesRepo.findAll();
        model.addAttribute("roomServiceList", roomServiceList);
        return "admin/roomService";
    }
    
    @RequestMapping(value="admin/addRoomService", method=GET)
    public String addRoomService(Model model){
        String action="addRoomService";
        List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findAll();
        model.addAttribute("roomService", new RoomServicesEntity());
        model.addAttribute("roomList", roomList);
        model.addAttribute("action", action);
        return "admin/addRoomService";
    }
    
    @RequestMapping(value="admin/addRoomService", method=POST)
    public String saveRoomService(RoomServicesEntity roomService){
        roomServicesRepo.save(roomService);
        return "redirect:/admin";
    }
    
    @RequestMapping(value="admin/editRoomService/{roomID}", method=GET)
    public String editRoomService(@PathVariable("roomID") int roomID, Model model){
        RoomServicesEntity roomService = roomServicesRepo.findOne(roomID);
        String action="updateRoomService";
        model.addAttribute("roomService", roomService);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/addRoomService";
    }
    
    @RequestMapping(value="admin/updateRoomService", method=POST)
    public String updateRoomService(RoomServicesEntity roomService){
        roomServicesRepo.save(roomService);
        return "redirect:/admin";
    }
    
    //Promotion
    
    @RequestMapping(value="admin/promotion", method = GET)
    public String showPromotion(Model model){
        List<PromotionEntity> promotionList = (List<PromotionEntity>) promotionRepo.findAll();
        model.addAttribute("promotionList", promotionList);
        return "admin/promotion";
    }
    
    @RequestMapping(value="admin/addPromotion", method=GET)
    public String addPromotion(Model model){
        String action="addPromotion";
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("action", action);
        return "admin/addPromotion";
    }
    
    @RequestMapping(value="admin/addPromotion", method=POST)
    public String savePromotion(PromotionEntity promotion){
        promotionRepo.save(promotion);
        return "redirect:/admin";
    }
    
    @RequestMapping(value="admin/editPromotion/{promotionID}", method=GET)
    public String editPromotion(@PathVariable("promotionID") int promotionID, Model model){
        PromotionEntity promotion = promotionRepo.findOne(promotionID);
        String action="updatePromotion";
        model.addAttribute("promotion", promotion);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/addPromotion";
    }
    
    @RequestMapping(value="admin/updatePromotion", method=POST)
    public String updatePromotion(PromotionEntity promotion){
        promotionRepo.save(promotion);
        return "redirect:/admin";
    }
}
