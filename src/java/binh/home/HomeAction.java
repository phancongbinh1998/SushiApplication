/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binh.home;

import binh.dao.SushiDAO;
import binh.dto.ImageDTO;
import binh.dto.SushiDTO;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Mochi
 */
public class HomeAction {
    private List<SushiDTO> list;
    private List<ImageDTO> listImg;
    private int count;
    private final String SUCCESS = "success";
    public HomeAction() {
    }
    
    public String execute() throws Exception {
        SushiDAO dao = new SushiDAO();
        
        dao.getSushi();
        dao.getImg();
        dao.getCount();
        list = dao.getList();
        setListImg(dao.getListImg());
        count = dao.returnCount();
        count++;
        dao.updateCount(count);
        Map session = ActionContext.getContext().getSession();
        session.put("COUNT", count);
        return SUCCESS;
    }

    /**
     * @return the list
     */
    public List<SushiDTO> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<SushiDTO> list) {
        this.list = list;
    }

    /**
     * @return the listImg
     */
    public List<ImageDTO> getListImg() {
        return listImg;
    }

    /**
     * @param listImg the listImg to set
     */
    public void setListImg(List<ImageDTO> listImg) {
        this.listImg = listImg;
    }

    /**
     * @return the count
     */
    public int getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(int count) {
        this.count = count;
    }
    
}
