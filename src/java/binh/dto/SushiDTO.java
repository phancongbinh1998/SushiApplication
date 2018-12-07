/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binh.dto;

/**
 *
 * @author Mochi
 */
public class SushiDTO {

    String title ;
    String imgDes;
    String detail ;
    Double price ;
    private String menuDesc;
    private String menuName;

    public SushiDTO(String title, String imgDes, String detail, Double price) {
        this.title = title;
        this.imgDes = imgDes;
        this.detail = detail;
        this.price = price;
    }
    
     public SushiDTO(String title, Double price, String menuDesc, String menuName) {
        this.title = title;
        this.price = price;
        this.menuDesc = menuDesc;
        this.menuName = menuName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgDes() {
        return imgDes;
    }

    public void setImgDes(String imgDes) {
        this.imgDes = imgDes;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return the menuDesc
     */
    public String getMenuDesc() {
        return menuDesc;
    }

    /**
     * @param menuDesc the menuDesc to set
     */
    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }

    /**
     * @return the menuName
     */
    public String getMenuName() {
        return menuName;
    }

    /**
     * @param menuName the menuName to set
     */
    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }
    
    
}
