/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binh.menu;

import binh.dao.SushiDAO;
import binh.dto.SushiDTO;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Mochi
 */
public class MenuAction {
    private HashMap<String, List<SushiDTO>> listMap;
    
    private final String SUCCESS = "success";
    public MenuAction() {
    }
    
    public String execute() throws Exception {
        SushiDAO dao = new SushiDAO();
        dao.getMenuID();
        
        listMap = dao.getMap();
        
        return SUCCESS;
    }

    /**
     * @return the listMap
     */
    public HashMap<String, List<SushiDTO>> getListMap() {
        return listMap;
    }

    /**
     * @param listMap the listMap to set
     */
    public void setListMap(HashMap<String, List<SushiDTO>> listMap) {
        this.listMap = listMap;
    }
    
}
