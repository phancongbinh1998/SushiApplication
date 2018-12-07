/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binh.dao;

import binh.dto.ImageDTO;
import binh.dto.SushiDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBConnection;

/**
 *
 * @author Mochi
 */
public class SushiDAO {

    private List<SushiDTO> list;

    public List<SushiDTO> getList() {
        return list;
    }

    public boolean getSushi() throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select title, imgDes, detail, price from tblProduct order by date DESC";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String title = rs.getString("title");
                    String imgDes = rs.getString("imgDes");
                    String detail = rs.getString("detail");
                    Double price = rs.getDouble("price");

                    SushiDTO dto = new SushiDTO(title, imgDes, detail, price);
                    if (this.list == null) {
                        this.list = new ArrayList<SushiDTO>();
                    }
                    this.list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
    private List<ImageDTO> listImg;

    public List<ImageDTO> getListImg() {
        return listImg;
    }

    public boolean getImg() throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select imgDesc from tblImg order by date DESC";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String imgDesc = rs.getString("imgDesc");

                    ImageDTO dto = new ImageDTO(imgDesc);
                    if (this.listImg == null) {
                        this.listImg = new ArrayList<ImageDTO>();
                    }
                    if (listImg.size() < 1) {
                        this.listImg.add(dto);
                    }

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
    private int count;

    public int returnCount() {
        return count;
    }

    public boolean getCount() throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select count from tblCount";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                if (rs.next()) {
                    count = rs.getInt("count");

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public boolean updateCount(int count) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update tblCount set count = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, count);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }

            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    private HashMap<String, List<SushiDTO>> map;

    public HashMap<String, List<SushiDTO>> getMap() {
        return map;
    }
    private String menuName;
    private String menuDesc;
    public List<SushiDTO> listPro;

    public boolean getMenuID() throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select ID from tblMenuu order by date DESC";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String ID = rs.getString("ID");
                    getMenuDetail(ID);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
    String cont;
    int countMenu = 0;
    public boolean getMenuDetail(String ID) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select IDSushi from tblRef where IDMenu = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                getMenu(ID);
                while (rs.next()) {
                    String IDSushi = rs.getString("IDSushi");
                    getPrice(IDSushi);
                }
                if (this.map == null) {
                    this.map = new HashMap<>();
                }
                countMenu++;
                cont = countMenu + "";
                this.map.put(cont, listPro);
                listPro= new ArrayList<>();

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public boolean getMenu(String IDMenu) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select menuName, menuDesc from tblMenuu where ID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, IDMenu);
                rs = stm.executeQuery();

                if (rs.next()) {
                    menuName = rs.getString("menuName");
                    menuDesc = rs.getString("menuDesc");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public boolean getPrice(String IDSushi) throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select title, price from tblProduct where ID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, IDSushi);
                rs = stm.executeQuery();

                if (rs.next()) {
                    String title = rs.getString("title");
                    Double price = rs.getDouble("price");

                    SushiDTO dto = new SushiDTO(title, price, menuDesc, menuName);
                    if (this.listPro == null) {
                        this.listPro = new ArrayList<SushiDTO>();
                    }
                    this.listPro.add(dto);

                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
}
