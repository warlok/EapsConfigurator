package com.config.eaps.objects;

import java.util.ArrayList;

/**
 * Created by dean on 10/16/15.
 */
public class Eaps {

    private int id;
    private String name;
    private String master;
    private ArrayList<String> nodes;

    public Eaps() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master;
    }

    public ArrayList<String> getNodes() {
        return nodes;
    }

    public void setNodes(ArrayList<String> nodes) {
        this.nodes = nodes;
    }
}
