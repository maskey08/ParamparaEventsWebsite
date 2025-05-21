package com.paramparaevents.service;

import com.paramparaevents.model.UserModel;
import java.util.*;

public class UserService {
    private static List<UserModel> userList = new ArrayList<>();
    private static int idCounter = 1;

    // Add User
    public void addUser(UserModel user) {
        user.setId(idCounter++);
        userList.add(user);
    }

    // Update User
    public void updateUser(UserModel updatedUser) {
        for (UserModel user : userList) {
            if (user.getId() == updatedUser.getId()) {
                user.setUserName(updatedUser.getUserName());
                user.setEmail(updatedUser.getEmail());
                user.setNumber(updatedUser.getNumber());
                break;
            }
        }
    }

    // Get User by ID
    public UserModel getUserById(int id) {
        for (UserModel user : userList) {
            if (user.getId() == id) return user;
        }
        return null;
    }

    // Get All Users
    public List<UserModel> getAllUsers() {
        return userList;
    }

    // Delete User
    public void deleteUser(int id) {
        userList.removeIf(u -> u.getId() == id);
    }
}
