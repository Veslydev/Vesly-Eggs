</div>
<div align="center">

# Paper (Super-Optimized)

</div>

## 📃 | Açıklama
İşte bu Egg'in içerdiği optimizasyonlarla ilgili açıklama...

Unutmayın, optimize edilmiş olması daha az RAM kullanımı anlamına gelmez, aksine, 4GB RAM'den başlayarak, çöp toplayıcının düzgün çalışması için maksimum değeri kullanacaktır.

Bu Eggi oluşturmak için kullanılan kaynaklar:   
https://www.spigotmc.org/threads/guide-server-optimization%E2%9A%A1.283181/   
https://shockbyte.com/billing/knowledgebase/153/Optimizing-spigotyml-to-Reduce-Lag.html   
https://shockbyte.com/billing/knowledgebase/154/Optimizing-bukkityml-to-Reduce-Lag.html   
https://shockbyte.com/billing/knowledgebase/155/Optimize-paperyml-to-Reduce-Lag.html   
https://cassiofernando.netlify.app/blog/minecraft-argumentos-java   
https://docs.papermc.io/paper/aikars-flags   

Azul Zulu:   
https://docs.azul.com/prime/what-to-expect   
https://github.com/Software-Noob/pterodactyl-images   

</div>
<div align="center">

## Optimizasyonlar

</div>

## 🐳 | Docker

Bu Egg tarafından kullanılan Docker'ın adı Azul Zulu'dur.

## 🗂 | Dosyalar

### 📄 | bukkit.yml

| Değişken | Orijinal | Değiştirilmiş | Daha fazla bilgi |
|--|--|--|--|
| monsters | 70 | 50 | Canavar sınırı. |
| animals | 10 | 8 | Hayvan sınırı. |
| water-animals | 5 | 3 | Suda yaşayan hayvanların sınırı. |
| ambient | 15 | 1 | Ortam canlılarının sınırı (yarasalar gibi). |
| period-in-ticks | 600 | 400 | Çöp toplama sisteminin kullanılmayan parçaları temizleme sıklığı. |
| monster-spawns | 1 | 2 | Canavar ortaya çıkışları arasındaki bekleme süresini belirler. |

### 📄 | paper-world-defaults.yml

| Değişken | Orijinal | Değiştirilmiş | Daha fazla bilgi |
|--|--|--|--|
| max-auto-save-chunks-per-tick | 24 | 8 | Tik başına kaydedilen maksimum yığın sayısı. |
| prevent-moving-into-unloaded-chunks | false | true | Oyuncular yüksüz bloklar üzerinde hareket edebilir. |
| max-entity-collisions | 8 | 2 | Bu değere ulaşıldıktan sonra çarpışmaları işlemeyi durdurur. |
| disable-chest-cat-detection | false | true | Üstünde bir kedi otursa bile sandıkları açın. |
| creative-arrow-despawn-rate | default | 180 | Yaratıcı modda oyuncular tarafından atılan okların çözülme hızı. |
| non-player-arrow-despawn-rate | default | 180 | Toyuncu olmayan varlıklar tarafından atılan okların çözülme oranı. |
| disable-move-event | false | true | Disables ```InventoryMoveItemEvent```. Hopper performansını önemli ölçüde artırır ancak bu Değişken'e dayanan bazı eklentileri bozabilir. |
| allow-non-player-entities-on-scoreboards | true | false | Sunucunun varlık çakışmalarını hesaplamak için harcadığı süreyi biraz azaltır. |
| keep-spawn-loaded-range | 10 | 8 | Yüklü tutmak için spawn etrafındaki parçaların değeri. |
| container-update | 1 | 2 | Sunucunun kapları (sandıklar, fırınlar...) ve envanterleri güncelleme hızı. |
| grass-spread | 1 | 2 | Sunucunun çimleri yaymaya çalıştığı gecikmeyi ayarlar. |
| mob-spawner | 1 | 2 | Dünyadaki mob spawner'lar tarafından varlık spawn hesaplamalarının sıklığını ayarlar. |

### 📄 | spigot.yml

| Değişken | Orijinal | Değiştirilmiş | Daha fazla bilgi |
|--|--|--|--|
| item | 2.5 | 4.0 | Eşyalar daha sık bir araya gelerek yerdeki eşya sayısını azaltacaktır. |
| exp | 3.0 | 6.0 | Deneyim küreleri daha sık bir araya gelerek yerdeki eşya sayısını azaltacaktır. |
| mob-spawn-range | 8 | 6 | Çetelerin ortaya çıkması için oyuncuya olan mesafe. |
| arrow-despawn-rate | 1200 | 300 | Hayatta kalma modundaki oyuncular tarafından atılan oklar tik başına daha hızlı kaybolacak (300 = 15s). |
| nerf-spawner-mobs | false | true | Yumurtalar tarafından ortaya çıkarılan Mobların yapay zekası olmayacak. |
| animals | 32 | 16 | Bir çetenin yapay zekasını etkinleştirmek için ne kadar yakın olması gerektiği. |
| monsters | 32 | 24 | Bir çetenin yapay zekasını etkinleştirmek için ne kadar yakın olması gerektiği. |
| misc | 16 | 8 | Bir çetenin yapay zekasını etkinleştirmek için ne kadar yakın olması gerektiği. |
| tile | 50 | 1000 | Bu özelliğin etkinleştirilmesiyle ilgili risk nedeniyle, özelliği etkin bir şekilde devre dışı bırakarak 1000 olarak ayarlayın. |
| entity | 50 | 1000 | Bu özelliğin etkinleştirilmesiyle ilgili risk nedeniyle, özelliği etkin bir şekilde devre dışı bırakarak 1000 olarak ayarlayın. |

### 📄 | server.properties

| Değişken | Orijinal | Değiştirilmiş | Daha fazla bilgi |
|--|--|--|--|
| network-compression-threshold | 256 | 512 | Sıkıştırmadan önce bir paketin boyutunu sınırlar. Daha yüksek ayarlamak, bant genişliği pahasına bazı kaynaklardan tasarruf sağlayabilir. |

## ⚙️ | Başlangıç

| Optimizasyon | Değişken |
|--|--|
| (0) Geral | ```java -Xms128M -Xmx${SERVER_MEMORY}M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ${SERVER_JARFILE}``` |
| (1) 1GB RAM | ```java -Xms128M -Xmx${SERVER_MEMORY}M -Xmn128m -XX:+DisableExplicitGC -XX:+UseNUMA -XX:MaxTenuringThreshold=15 -XX:MaxGCPauseMillis=30 -XX:GCPauseIntervalMillis=150 -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:+UseCompressedOops -XX:+OptimizeStringConcat  -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:SoftRefLRUPolicyMSPerMB=2000 -XX:ParallelGCThreads=10 -jar ${SERVER_JARFILE}``` |
| (2) 2GB RAM | ```java -Xms128M -Xmx${SERVER_MEMORY}M -Xmn384m -XX:+DisableExplicitGC -XX:+UseNUMA -XX:MaxTenuringThreshold=15 -XX:MaxGCPauseMillis=30 -XX:GCPauseIntervalMillis=150 -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:+UseCompressedOops -XX:+OptimizeStringConcat  -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:SoftRefLRUPolicyMSPerMB=2000 -XX:ParallelGCThreads=10 -jar ${SERVER_JARFILE}``` |
| (3) 3Gb RAM | ```java --Xms128M -Xmx${SERVER_MEMORY}M -Xmn768m -XX:+DisableExplicitGC -XX:+UseNUMA -XX:MaxTenuringThreshold=15 -XX:MaxGCPauseMillis=30 -XX:GCPauseIntervalMillis=150 -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:+UseCompressedOops -XX:+OptimizeStringConcat  -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:ParallelGCThreads=10 -jar ${SERVER_JARFILE}``` |
| (4) 4+Gb RAM | ```java -Xms128M -Xmx${SERVER_MEMORY}M -Xmn768m -XX:+DisableExplicitGC -XX:+UseNUMA -XX:MaxTenuringThreshold=15 -XX:MaxGCPauseMillis=30 -XX:GCPauseIntervalMillis=150 -XX:-UseGCOverheadLimit -XX:+UseBiasedLocking -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=15 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:+UseCompressedOops -XX:+OptimizeStringConcat  -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:ParallelGCThreads=10 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:-UsePerfData -jar ${SERVER_JARFILE}``` |
| (5) 4GB RAM / 4threads / 4cores | ```java -Xms128M -Xmx${SERVER_MEMORY}M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UseCompressedOops -XX:-UsePerfData -XX:MaxGCPauseMillis=200 -XX:ParallelGCThreads=4 -XX:ConcGCThreads=2 -XX:+UseG1GC -XX:InitiatingHeapOccupancyPercent=50 -XX:G1HeapRegionSize=1 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=8 -jar ${SERVER_JARFILE}``` |
| (6) 8+GB RAM / 8threads / 4cores | ```java -Xms128M -Xmx${SERVER_MEMORY}M -Xmn512m -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:-UsePerfData -XX:MaxGCPauseMillis=200 -XX:ParallelGCThreads=8 -XX:ConcGCThreads=2 -XX:+UseG1GC -XX:InitiatingHeapOccupancyPercent=50 -XX:G1HeapRegionSize=1 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=8 -jar ${SERVER_JARFILE}``` |
| (7) 12+GB RAM | ```java -Xms128M -Xmx${SERVER_MEMORY}M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=20 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ${SERVER_JARFILE}``` |