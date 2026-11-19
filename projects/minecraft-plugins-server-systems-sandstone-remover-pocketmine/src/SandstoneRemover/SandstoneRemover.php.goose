// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-sandstone-remover-pocketmine/src/SandstoneRemover/SandstoneRemover.php
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-sandstone-remover-pocketmine/src/SandstoneRemover/SandstoneRemover.php");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-sandstone-remover-pocketmine/src/SandstoneRemover/SandstoneRemover.php), unveraendert, als Inline-Doku ----
// <?php
//
// declare(strict_types=1);
//
// namespace SandstoneRemover;
//
// use pocketmine\block\BlockTypeIds;
// use pocketmine\plugin\PluginBase;
// use pocketmine\scheduler\TaskHandler;
// use pocketmine\world\World;
// use pocketmine\math\Vector3;
// use pocketmine\scheduler\AsyncTask;
// use pocketmine\Server;
// use pocketmine\utils\Config;
//
// class SandstoneRemover extends PluginBase {
//     /** @var TaskHandler */
//     private $taskHandler;
//     
//     /** @var string */
//     private $worldName;
//     
//     /** @var int|null */
//     private $radius;
//     
//     public function onEnable(): void {
//         $this->saveDefaultConfig();
//         $this->loadConfig();
//         
//         // Schedule the task to run every 10 seconds (200 ticks)
//         $this->taskHandler = $this->getScheduler()->scheduleRepeatingTask(
//             new RemoveSandstoneTask($this), 
//             200
//         );
//         
//         $this->getLogger()->info("SandstoneRemover has been enabled!");
//         $this->getLogger()->info("Target world: " . $this->worldName);
//         if ($this->radius !== null) {
//             $this->getLogger()->info("Radius: " . $this->radius . " blocks");
//         } else {
//             $this->getLogger()->info("Removing all sandstone blocks in the world");
//         }
//     }
//     
//     public function onDisable(): void {
//         $this->getLogger()->info("SandstoneRemover has been disabled!");
//         if ($this->taskHandler !== null) {
//             $this->taskHandler->cancel();
//         }
//     }
//     
//     private function loadConfig(): void {
//         $config = $this->getConfig();
//         $this->worldName = $config->get("world", "world");
//         $this->radius = $config->get("radius", null);
//         
//         // Validate config values
//         if (!$this->getServer()->getWorldManager()->isWorldLoaded($this->worldName)) {
//             $this->getLogger()->warning("The world '$this->worldName' is not loaded. Using default world.");
//             $this->worldName = "world";
//         }
//         
//         if ($this->radius !== null && (!is_numeric($this->radius) || $this->radius <= 0)) {
//             $this->getLogger()->warning("Invalid radius value in config. Setting to null (all blocks).");
//             $this->radius = null;
//         }
//     }
//     
//     /**
//      * Get the target world name
//      * @return string
//      */
//     public function getWorldName(): string {
//         return $this->worldName;
//     }
//     
//     /**
//      * Get the configured radius
//      * @return int|null
//      */
//     public function getRadius(): ?int {
//         return $this->radius;
//     }
//     
//     /**
//      * Remove sandstone blocks from the world
//      */
//     public function removeSandstoneBlocks(): void {
//         $world = $this->getServer()->getWorldManager()->getWorldByName($this->worldName);
//         
//         if ($world === null) {
//             $this->getLogger()->error("Target world '$this->worldName' not found!");
//             return;
//         }
//         
//         // Collect chunks to process
//         $chunks = [];
//         foreach ($world->getLoadedChunks() as $hash => $chunk) {
//             $chunks[] = $chunk;
//         }
//         
//         // Process chunks in async task
//         $this->getServer()->getAsyncPool()->submitTask(
//             new SandstoneRemovalTask(
//                 $this->worldName,
//                 $chunks,
//                 $this->radius,
//                 $world->getSpawnLocation()->x,
//                 $world->getSpawnLocation()->y,
//                 $world->getSpawnLocation()->z
//             )
//         );
//     }
// }
//
// class RemoveSandstoneTask extends \pocketmine\scheduler\Task {
//     /** @var SandstoneRemover */
//     private $plugin;
//     
//     public function __construct(SandstoneRemover $plugin) {
//         $this->plugin = $plugin;
//     }
//     
//     public function onRun(): void {
//         $this->plugin->removeSandstoneBlocks();
//     }
// }
//
// class SandstoneRemovalTask extends AsyncTask {
//     /** @var string */
//     private $worldName;
//     
//     /** @var array */
//     private $chunkData;
//     
//     /** @var int|null */
//     private $radius;
//     
//     /** @var float */
//     private $spawnX;
//     
//     /** @var float */
//     private $spawnY;
//     
//     /** @var float */
//     private $spawnZ;
//     
//     /** @var array */
//     private $results;
//     
//     public function __construct(string $worldName, array $chunks, ?int $radius, float $spawnX, float $spawnY, float $spawnZ) {
//         $this->worldName = $worldName;
//         
//         // Serialize chunk data
//         $chunkData = [];
//         foreach ($chunks as $chunk) {
//             $chunkData[] = [
//                 'x' => $chunk->getX(),
//                 'z' => $chunk->getZ()
//             ];
//         }
//         $this->chunkData = $chunkData;
//         
//         $this->radius = $radius;
//         $this->spawnX = $spawnX;
//         $this->spawnY = $spawnY;
//         $this->spawnZ = $spawnZ;
//     }
//     
//     public function onRun(): void {
//         $this->results = [];
//         $sandstonesToRemove = [];
//         
//         foreach ($this->chunkData as $chunkData) {
//             $sandstonesToRemove[] = [
//                 'chunkX' => $chunkData['x'],
//                 'chunkZ' => $chunkData['z']
//             ];
//         }
//         
//         $this->setResult($sandstonesToRemove);
//     }
//     
//     public function onCompletion(): void {
//         $server = Server::getInstance();
//         $world = $server->getWorldManager()->getWorldByName($this->worldName);
//         
//         if ($world === null) {
//             return;
//         }
//         
//         $blocks = $this->getResult();
//         $count = 0;
//         
//         foreach ($blocks as $blockData) {
//             $chunkX = $blockData['chunkX'];
//             $chunkZ = $blockData['chunkZ'];
//             
//             // Check if chunk is loaded
//             if (!$world->isChunkLoaded($chunkX, $chunkZ)) {
//                 continue;
//             }
//             
//             $chunk = $world->getChunk($chunkX, $chunkZ);
//             
//             // Process chunk for sandstone blocks
//             for ($x = 0; $x < 16; $x++) {
//                 for ($z = 0; $z < 16; $z++) {
//                     for ($y = $world->getMinY(); $y < $world->getMaxY(); $y++) {
//                         $worldX = ($chunkX << 4) + $x;
//                         $worldZ = ($chunkZ << 4) + $z;
//                         
//                         // Check radius if set
//                         if ($this->radius !== null) {
//                             $distance = sqrt(
//                                 pow($worldX - $this->spawnX, 2) + 
//                                 pow($y - $this->spawnY, 2) + 
//                                 pow($worldZ - $this->spawnZ, 2)
//                             );
//                             
//                             if ($distance > $this->radius) {
//                                 continue;
//                             }
//                         }
//                         
//                         $block = $world->getBlockAt($worldX, $y, $worldZ);
//                         
//                         // Check if the block is sandstone
//                         if ($block->getTypeId() === BlockTypeIds::SANDSTONE) {
//                             $world->setBlockAt($worldX, $y, $worldZ, \pocketmine\block\VanillaBlocks::AIR());
//                             $count++;
//                         }
//                     }
//                 }
//             }
//         }
//         
//         $plugin = $server->getPluginManager()->getPlugin("SandstoneRemover");
//         if ($plugin instanceof SandstoneRemover) {
//             $plugin->getLogger()->info("Removed $count sandstone blocks");
//         }
//     }
// }
