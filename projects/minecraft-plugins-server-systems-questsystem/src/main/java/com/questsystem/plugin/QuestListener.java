package com.questsystem.plugin;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDeathEvent;
import org.bukkit.event.entity.EntityPickupItemEvent;
import org.bukkit.entity.Player;

public class QuestListener implements Listener {
    private final QuestManager questManager;

    public QuestListener(QuestSystemPlugin plugin) {
        this.questManager = plugin.getQuestManager();
    }

    @EventHandler
    public void onEntityDeath(EntityDeathEvent event) {
        Player killer = event.getEntity().getKiller();
        if (killer != null) {
            questManager.checkProgress(killer, 
                Objective.ObjectiveType.KILL, 
                event.getEntityType().name());
        }
    }

    @EventHandler
    public void onItemPickup(EntityPickupItemEvent event) {
        if (event.getEntity() instanceof Player) {
            Player player = (Player) event.getEntity();
            questManager.checkProgress(player,
                Objective.ObjectiveType.COLLECT,
                event.getItem().getItemStack().getType().name());
        }
    }
}