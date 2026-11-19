// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_setspawn.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_setspawn.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_setspawn.java), unveraendert, als Inline-Doku ----
// package net.bote.bffa.commands;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// import net.bote.bffa.main.Main;
// import net.bote.bffa.utils.LocationManager;
//
// public class CMD_setspawn implements CommandExecutor {
// 	
// 	private Main plugin;
//
// 	public CMD_setspawn(Main main) {
// 		// TODO Auto-generated constructor stub
// 		this.plugin = main;
// 	}
//
// 	@Override
// 	public boolean onCommand(CommandSender sender, Command arg1, String arg2, String[] args) {
// 		// TODO Auto-generated method stub
// 		if(sender instanceof Player) {
// 			Player p = (Player)sender;
// 			if(p.hasPermission("bffa.admin.setspawn")) {
// 				if(args.length == 0) {
// 					
// 					LocationManager.setLocation("Spawn", p.getLocation());
// 					
// 					LocationManager.saveLocations();
// 					
// 					p.sendMessage(Main.prefix+"�7Du hast den �eSpawn �7gesetzt!");
// 				} else {
// 					p.sendMessage(Main.prefix+"�7Nutze: �e/setspawn");
// 				}
// 			} else {
// 				p.sendMessage(Main.prefix+"�cKein Recht!");
// 			}
// 		}
// 		return true;
// 	}
//
// }
//
