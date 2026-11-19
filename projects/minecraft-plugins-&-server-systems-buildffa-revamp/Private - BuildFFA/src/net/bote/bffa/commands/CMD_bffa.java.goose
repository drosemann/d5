// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_bffa.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_bffa.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/commands/CMD_bffa.java), unveraendert, als Inline-Doku ----
// package net.bote.bffa.commands;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// import net.bote.bffa.main.Main;
//
// public class CMD_bffa implements CommandExecutor {
// 	
// 	private Main plugin;
//
// 	public CMD_bffa(Main main) {
// 		// TODO Auto-generated constructor stub
// 		this.plugin = main;
// 	}
//
// 	@Override
// 	public boolean onCommand(CommandSender sender, Command arg1, String arg2, String[] args) {
// 		// TODO Auto-generated method stub
// 		if(sender instanceof Player) {
// 			Player p = (Player)sender;
// 			if(p.hasPermission("bffa.admin.help")) {
// 				if(args.length == 1) {
// 					if(args[0].equalsIgnoreCase("help")) {
// 						p.sendMessage("�6-----�7[�bBuildFFA Help�7]�6-----");
// 						p.sendMessage("�eSpawn setzen �8- �7/setspawn");
// 						p.sendMessage("�eTodesh�he setzen �8- �7/setheight");
// 						p.sendMessage("�eVillager setzen �8- �7/setvillager");
// 						p.sendMessage("�eMapnamen setzen �8- �7/setname <Name>");
// 						p.sendMessage("");
// 						p.sendMessage("�eIn den Build gehen �8- �7/build");
// 						p.sendMessage("�eTeaming editieren �8- �7/teaming <allow | deny>");
// 						p.sendMessage("�6-----�7[�bBuildFFA Help�7]�6-----");
// 					} else {
// 						sendHelp(p);
// 					}
// 				} else {
// 					sendHelp(p);
// 				}
// 			} else {
// 				p.sendMessage(Main.noperm);
// 			}
// 		}
// 		return true;
// 	}
// 	private void sendHelp(Player p) {
// 		p.sendMessage(Main.prefix + "�7Nutze: �e/bffa <help>");
// 	}
//
// }
//
