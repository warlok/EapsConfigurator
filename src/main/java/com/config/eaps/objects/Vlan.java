package com.config.eaps.objects;

/**
 * Created by dean on 10/18/15.
 */
public class Vlan {

    private String vlanName;
    private int vlanID;

    public Vlan() {

    }
    public Vlan(String vlanName) {
        this.vlanName = vlanName;
    }

    public String getVlanName() {
        return vlanName;
    }

    public void setVlanName(String vlanName) {
        this.vlanName = vlanName;
    }

    public int getVlanID() {
        return vlanID;
    }

    public void setVlanID(int vlanID) {
        this.vlanID = vlanID;
    }
}
