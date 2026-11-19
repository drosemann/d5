package com.hearthrift.worlds;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public class WorldPermissions {
    private final UUID owner;
    private final Set<UUID> guests;
    private final Set<UUID> moderators;
    private final Map<UUID, EnumSet<Permission>> playerPermissions;
    
    public enum Permission {
        BUILD,
        BREAK,
        INTERACT,
        CONTAINER_ACCESS,
        INVITE_OTHERS,
        MODIFY_PERMISSIONS,
        USE_COMMANDS,
        MANAGE_SPAWNERS
    }

    public WorldPermissions(UUID owner) {
        this.owner = owner;
        this.guests = new HashSet<>();
        this.moderators = new HashSet<>();
        this.playerPermissions = new HashMap<>();
        
        // Set default permissions for owner
        EnumSet<Permission> ownerPerms = EnumSet.allOf(Permission.class);
        playerPermissions.put(owner, ownerPerms);
    }
    
    public boolean isOwner(UUID player) {
        return owner.equals(player);
    }
    
    public boolean isModerator(UUID player) {
        return moderators.contains(player);
    }
    
    public boolean hasAccess(UUID player) {
        return isOwner(player) || isModerator(player) || guests.contains(player);
    }
    
    public void addGuest(UUID player) {
        guests.add(player);
    }
    
    public void removeGuest(UUID player) {
        guests.remove(player);
    }
    
    public void addModerator(UUID player) {
        moderators.add(player);
        guests.remove(player); // Promote from guest if they were one
    }
    
    public void removeModerator(UUID player) {
        moderators.remove(player);
    }
    
    public Set<UUID> getGuests() {
        return new HashSet<>(guests);
    }
    
    public Set<UUID> getModerators() {
        return new HashSet<>(moderators);
    }

    public void setPermissions(UUID player, EnumSet<Permission> permissions) {
        if (!isOwner(player)) {
            playerPermissions.put(player, permissions);
        }
    }

    public void addPermission(UUID player, Permission permission) {
        playerPermissions.computeIfAbsent(player, k -> EnumSet.noneOf(Permission.class)).add(permission);
    }

    public void removePermission(UUID player, Permission permission) {
        if (!isOwner(player) && playerPermissions.containsKey(player)) {
            playerPermissions.get(player).remove(permission);
        }
    }

    public boolean hasPermission(UUID player, Permission permission) {
        if (isOwner(player)) {
            return true;
        }
        
        EnumSet<Permission> perms = playerPermissions.get(player);
        if (perms == null) {
            return false;
        }
        
        return perms.contains(permission);
    }

    public EnumSet<Permission> getPlayerPermissions(UUID player) {
        if (isOwner(player)) {
            return EnumSet.allOf(Permission.class);
        }
        return playerPermissions.getOrDefault(player, EnumSet.noneOf(Permission.class));
    }

    public void setupDefaultPermissions(UUID player, boolean isModerator) {
        EnumSet<Permission> permissions = EnumSet.noneOf(Permission.class);
        
        if (isModerator) {
            permissions.add(Permission.BUILD);
            permissions.add(Permission.BREAK);
            permissions.add(Permission.INTERACT);
            permissions.add(Permission.CONTAINER_ACCESS);
            permissions.add(Permission.INVITE_OTHERS);
            permissions.add(Permission.USE_COMMANDS);
        } else {
            // Guest permissions
            permissions.add(Permission.INTERACT);
            permissions.add(Permission.USE_COMMANDS);
        }
        
        setPermissions(player, permissions);
    }
}