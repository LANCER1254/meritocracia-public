say Leonhart Bakery build start

# ============================================================
# レオンハルト家のパン屋兼民家
# 起点: プレイヤー足元 ~ ~ ~
# 建物: X +0~+10, Y +0~+10, Z +0~+12
# 正面 (販売口) = Z+0 側  /  裏 = Z+12 側
# ============================================================

# ============================================================
# 0. 地盤 (Y-1)
# ============================================================
fill ~0 ~-1 ~0 ~10 ~-1 ~12 minecraft:stone_bricks

# ============================================================
# 1. 1F 床 (Y=0)
# ============================================================
fill ~0 ~0 ~0 ~10 ~0 ~12 minecraft:stone_bricks
# 販売スペース床 (Z 0~5)
fill ~1 ~0 ~1 ~9 ~0 ~5  minecraft:chiseled_stone_bricks
# 工房床 (Z 6~11)
fill ~1 ~0 ~6 ~9 ~0 ~11 minecraft:cobblestone
# 店前 玄関石畳
fill ~0 ~-1 ~-2 ~10 ~-1 ~-1 minecraft:stone_bricks
fill ~0 ~0  ~-2 ~10 ~0  ~-1 minecraft:stone_bricks
setblock ~4 ~0 ~-1 minecraft:stone_brick_slab
setblock ~5 ~0 ~-1 minecraft:stone_brick_slab
setblock ~6 ~0 ~-1 minecraft:stone_brick_slab

# ============================================================
# 2. 1F 外壁 (Y=1~4)
# ============================================================
# 南壁 Z=0 (正面)
fill ~0 ~1 ~0 ~10 ~4 ~0 minecraft:stone_bricks
# 北壁 Z=12
fill ~0 ~1 ~12 ~10 ~4 ~12 minecraft:stone_bricks
# 西壁 X=0
fill ~0 ~1 ~0 ~0 ~4 ~12 minecraft:stone_bricks
# 東壁 X=10
fill ~10 ~1 ~0 ~10 ~4 ~12 minecraft:stone_bricks
# コーナー強調 (mud_bricks)
fill ~0 ~1 ~0 ~0 ~4 ~0   minecraft:mud_bricks
fill ~10 ~1 ~0 ~10 ~4 ~0  minecraft:mud_bricks
fill ~0 ~1 ~12 ~0 ~4 ~12  minecraft:mud_bricks
fill ~10 ~1 ~12 ~10 ~4 ~12 minecraft:mud_bricks

# ============================================================
# 3. 1F 開口 (窓・扉)
# ============================================================
# 正面 (Z=0) メイン入口
setblock ~4 ~1 ~0 minecraft:air
setblock ~5 ~1 ~0 minecraft:air
setblock ~4 ~2 ~0 minecraft:air
setblock ~5 ~2 ~0 minecraft:air
# 入口ドア
setblock ~4 ~1 ~0 minecraft:spruce_door[half=lower,hinge=left,facing=south,open=false]
setblock ~4 ~2 ~0 minecraft:spruce_door[half=upper,hinge=left,facing=south,open=false]
setblock ~5 ~1 ~0 minecraft:spruce_door[half=lower,hinge=right,facing=south,open=false]
setblock ~5 ~2 ~0 minecraft:spruce_door[half=upper,hinge=right,facing=south,open=false]
# 正面 左窓 (販売カウンター用)
setblock ~1 ~2 ~0 minecraft:air
setblock ~2 ~2 ~0 minecraft:air
setblock ~1 ~3 ~0 minecraft:glass_pane
setblock ~2 ~3 ~0 minecraft:glass_pane
# 正面 右窓
setblock ~7 ~2 ~0 minecraft:air
setblock ~8 ~2 ~0 minecraft:air
setblock ~7 ~3 ~0 minecraft:glass_pane
setblock ~8 ~3 ~0 minecraft:glass_pane
# 東壁 窓 (工房採光)
setblock ~10 ~2 ~8 minecraft:air
setblock ~10 ~3 ~8 minecraft:glass_pane
setblock ~10 ~2 ~10 minecraft:air
setblock ~10 ~3 ~10 minecraft:glass_pane
# 西壁 窓
setblock ~0 ~2 ~8 minecraft:air
setblock ~0 ~3 ~8 minecraft:glass_pane

# ============================================================
# 4. 1F 天井 / 2F 床 (Y=5)
# ============================================================
fill ~0 ~5 ~0 ~10 ~5 ~12 minecraft:spruce_planks
# 梁
fill ~0 ~5 ~0  ~10 ~5 ~0  minecraft:stripped_spruce_log
fill ~0 ~5 ~4  ~10 ~5 ~4  minecraft:stripped_spruce_log
fill ~0 ~5 ~8  ~10 ~5 ~8  minecraft:stripped_spruce_log
fill ~0 ~5 ~12 ~10 ~5 ~12 minecraft:stripped_spruce_log

# ============================================================
# 5. 2F 外壁 (Y=6~8)
# ============================================================
# 南壁
fill ~0 ~6 ~0 ~10 ~8 ~0 minecraft:stripped_spruce_log
# 北壁
fill ~0 ~6 ~12 ~10 ~8 ~12 minecraft:stripped_spruce_log
# 東西壁
fill ~0 ~6 ~0  ~0 ~8 ~12 minecraft:birch_planks
fill ~10 ~6 ~0 ~10 ~8 ~12 minecraft:birch_planks
# 柱 (コーナー)
setblock ~0  ~6 ~0  minecraft:stripped_spruce_log
setblock ~0  ~7 ~0  minecraft:stripped_spruce_log
setblock ~0  ~8 ~0  minecraft:stripped_spruce_log
setblock ~10 ~6 ~0  minecraft:stripped_spruce_log
setblock ~10 ~7 ~0  minecraft:stripped_spruce_log
setblock ~10 ~8 ~0  minecraft:stripped_spruce_log
setblock ~0  ~6 ~12 minecraft:stripped_spruce_log
setblock ~0  ~7 ~12 minecraft:stripped_spruce_log
setblock ~0  ~8 ~12 minecraft:stripped_spruce_log
setblock ~10 ~6 ~12 minecraft:stripped_spruce_log
setblock ~10 ~7 ~12 minecraft:stripped_spruce_log
setblock ~10 ~8 ~12 minecraft:stripped_spruce_log

# ============================================================
# 6. 2F 窓
# ============================================================
# 南面 左右 (正面2F)
setblock ~2 ~7 ~0 minecraft:air
setblock ~3 ~7 ~0 minecraft:air
setblock ~2 ~7 ~0 minecraft:glass_pane
setblock ~3 ~7 ~0 minecraft:glass_pane
setblock ~7 ~7 ~0 minecraft:air
setblock ~8 ~7 ~0 minecraft:air
setblock ~7 ~7 ~0 minecraft:glass_pane
setblock ~8 ~7 ~0 minecraft:glass_pane
# 北面
setblock ~3 ~7 ~12 minecraft:air
setblock ~4 ~7 ~12 minecraft:air
setblock ~3 ~7 ~12 minecraft:glass_pane
setblock ~4 ~7 ~12 minecraft:glass_pane
setblock ~6 ~7 ~12 minecraft:air
setblock ~7 ~7 ~12 minecraft:air
setblock ~6 ~7 ~12 minecraft:glass_pane
setblock ~7 ~7 ~12 minecraft:glass_pane
# 東面
setblock ~10 ~7 ~4  minecraft:air
setblock ~10 ~7 ~4  minecraft:glass_pane
setblock ~10 ~7 ~8  minecraft:air
setblock ~10 ~7 ~8  minecraft:glass_pane
# 西面
setblock ~0 ~7 ~4  minecraft:air
setblock ~0 ~7 ~4  minecraft:glass_pane
setblock ~0 ~7 ~9  minecraft:air
setblock ~0 ~7 ~9  minecraft:glass_pane

# ============================================================
# 7. 屋根 (Y=9~10)
# ============================================================
# 棟木
fill ~0 ~10 ~0 ~10 ~10 ~12 minecraft:spruce_planks
# 南北 ガブル (切妻)
fill ~0 ~9 ~0 ~10 ~9 ~0 minecraft:spruce_planks
fill ~0 ~9 ~12 ~10 ~9 ~12 minecraft:spruce_planks
setblock ~5 ~10 ~0  minecraft:spruce_planks
setblock ~5 ~10 ~12 minecraft:spruce_planks
# 屋根 南側スロープ (Z=0側 下から)
fill ~0 ~9 ~1 ~10 ~9 ~1 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~0 ~9 ~2 ~10 ~9 ~2 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~0 ~9 ~3 ~10 ~9 ~3 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~0 ~9 ~4 ~10 ~9 ~4 minecraft:spruce_stairs[facing=south,half=bottom]
fill ~0 ~9 ~5 ~10 ~9 ~5 minecraft:spruce_stairs[facing=south,half=bottom]
# 屋根 北側スロープ (Z=12側 下から)
fill ~0 ~9 ~11 ~10 ~9 ~11 minecraft:spruce_stairs[facing=north,half=bottom]
fill ~0 ~9 ~10 ~10 ~9 ~10 minecraft:spruce_stairs[facing=north,half=bottom]
fill ~0 ~9 ~9  ~10 ~9 ~9  minecraft:spruce_stairs[facing=north,half=bottom]
fill ~0 ~9 ~8  ~10 ~9 ~8  minecraft:spruce_stairs[facing=north,half=bottom]
fill ~0 ~9 ~7  ~10 ~9 ~7  minecraft:spruce_stairs[facing=north,half=bottom]
# 屋根 中央フラット (Z=6)
fill ~0 ~9 ~6 ~10 ~9 ~6 minecraft:spruce_slab
# 屋根 軒先装飾 (spruce_slab)
fill ~0 ~8 ~0  ~10 ~8 ~0  minecraft:spruce_slab[type=bottom]
fill ~0 ~8 ~12 ~10 ~8 ~12 minecraft:spruce_slab[type=bottom]
fill ~-1 ~8 ~1 ~-1 ~8 ~11 minecraft:spruce_slab[type=bottom]
fill ~11 ~8 ~1 ~11 ~8 ~11 minecraft:spruce_slab[type=bottom]
# 軒先 延長 (正面・背面)
fill ~-1 ~8 ~0 ~11 ~8 ~0 minecraft:spruce_slab[type=bottom]
fill ~-1 ~8 ~12 ~11 ~8 ~12 minecraft:spruce_slab[type=bottom]

# ============================================================
# 8. 煙突 (X=7~8, Z=11~12 / 工房上)
# ============================================================
fill ~7 ~5 ~10 ~8 ~5 ~11 minecraft:stone_bricks
fill ~7 ~6 ~10 ~8 ~6 ~11 minecraft:stone_bricks
fill ~7 ~7 ~10 ~8 ~7 ~11 minecraft:stone_bricks
fill ~7 ~8 ~10 ~8 ~8 ~11 minecraft:stone_bricks
fill ~7 ~9 ~10 ~8 ~9 ~11 minecraft:cobblestone_wall
fill ~7 ~10 ~10 ~8 ~10 ~11 minecraft:cobblestone_wall
fill ~7 ~11 ~10 ~8 ~11 ~11 minecraft:cobblestone_wall
# 煙突口 (campfire)
setblock ~7 ~11 ~10 minecraft:campfire[lit=true,signal_fire=false,waterlogged=false]
setblock ~8 ~11 ~10 minecraft:campfire[lit=true,signal_fire=false,waterlogged=false]

# ============================================================
# 9. 1F 販売スペース (Z=0~5)
# ============================================================
# 販売カウンター (Z=1 沿い)
fill ~1 ~1 ~1 ~3 ~1 ~1 minecraft:spruce_planks
fill ~1 ~2 ~1 ~3 ~2 ~1 minecraft:spruce_slab
fill ~6 ~1 ~1 ~9 ~1 ~1 minecraft:spruce_planks
fill ~6 ~2 ~1 ~9 ~2 ~1 minecraft:spruce_slab
# カウンター内側 (店員側)
setblock ~2 ~1 ~2 minecraft:barrel[facing=up]
setblock ~7 ~1 ~2 minecraft:barrel[facing=up]
setblock ~8 ~1 ~2 minecraft:barrel[facing=up]
# パン陳列 (カウンター上)
setblock ~1 ~3 ~1 minecraft:flower_pot
setblock ~9 ~3 ~1 minecraft:flower_pot
setblock ~1 ~3 ~0 minecraft:potted_poppy
setblock ~9 ~3 ~0 minecraft:potted_poppy
# 窓辺の鉢植え (正面窓)
setblock ~2 ~3 ~0 minecraft:potted_poppy
setblock ~7 ~3 ~0 minecraft:potted_poppy
# ランタン (正面入口上)
setblock ~4 ~3 ~0 minecraft:lantern[hanging=false]
setblock ~5 ~3 ~0 minecraft:lantern[hanging=false]
# 陳列棚風 (東壁沿い 販売ゾーン)
fill ~9 ~1 ~2 ~9 ~1 ~4 minecraft:spruce_planks
fill ~9 ~2 ~2 ~9 ~2 ~4 minecraft:spruce_slab
setblock ~9 ~3 ~3 minecraft:item_frame[facing=west]
setblock ~9 ~2 ~3 minecraft:item_frame[facing=west]
# 西壁 メニュー板風
setblock ~1 ~3 ~2 minecraft:item_frame[facing=east]
# 店内ランタン
setblock ~3 ~4 ~3 minecraft:lantern[hanging=true]
setblock ~7 ~4 ~3 minecraft:lantern[hanging=true]
# 仕切り柱 (販売↔工房)
setblock ~0 ~1 ~5 minecraft:stripped_spruce_log
setblock ~0 ~2 ~5 minecraft:stripped_spruce_log
setblock ~0 ~3 ~5 minecraft:stripped_spruce_log
setblock ~0 ~4 ~5 minecraft:stripped_spruce_log
setblock ~10 ~1 ~5 minecraft:stripped_spruce_log
setblock ~10 ~2 ~5 minecraft:stripped_spruce_log
setblock ~10 ~3 ~5 minecraft:stripped_spruce_log
setblock ~10 ~4 ~5 minecraft:stripped_spruce_log
# 仕切り 腰壁
fill ~1 ~1 ~5 ~3 ~2 ~5 minecraft:spruce_planks
fill ~7 ~1 ~5 ~9 ~2 ~5 minecraft:spruce_planks
# 通路 (中央 Z=5)
setblock ~4 ~1 ~5 minecraft:spruce_trapdoor[facing=north,half=bottom,open=false]
setblock ~5 ~1 ~5 minecraft:spruce_trapdoor[facing=north,half=bottom,open=false]
setblock ~6 ~1 ~5 minecraft:spruce_trapdoor[facing=north,half=bottom,open=false]

# ============================================================
# 10. 1F パン工房 (Z=6~11)
# ============================================================
# 石造竈 (X=7~9, Z=10~11)
fill ~7 ~0 ~10 ~9 ~0 ~11 minecraft:stone_bricks
fill ~7 ~1 ~10 ~9 ~2 ~11 minecraft:stone_bricks
fill ~7 ~3 ~10 ~9 ~3 ~11 minecraft:stone_brick_slab
# 竈口
setblock ~8 ~1 ~10 minecraft:furnace[facing=north,lit=false]
setblock ~8 ~2 ~10 minecraft:air
setblock ~7 ~2 ~10 minecraft:air
setblock ~9 ~2 ~10 minecraft:air
# 竈横ランタン
setblock ~7 ~3 ~10 minecraft:torch
setblock ~9 ~3 ~10 minecraft:torch
# こね台 (作業台)
setblock ~5 ~1 ~10 minecraft:crafting_table
setblock ~4 ~1 ~10 minecraft:crafting_table
# 材料棚 (西壁沿い)
fill ~1 ~1 ~8 ~1 ~1 ~11 minecraft:spruce_planks
fill ~1 ~2 ~8 ~1 ~2 ~11 minecraft:spruce_slab
setblock ~1 ~3 ~9  minecraft:barrel[facing=east]
setblock ~1 ~3 ~11 minecraft:barrel[facing=east]
setblock ~1 ~1 ~7  minecraft:barrel[facing=up]
# 工房ランタン
setblock ~3 ~4 ~8  minecraft:lantern[hanging=true]
setblock ~8 ~4 ~8  minecraft:lantern[hanging=true]
setblock ~5 ~4 ~11 minecraft:lantern[hanging=true]
# 工房 東壁 窓辺
setblock ~9 ~1 ~9 minecraft:potted_poppy
# 工房内 作業用ランタン
setblock ~6 ~3 ~7 minecraft:torch
# 裏口 (Z=12 北壁)
setblock ~5 ~1 ~12 minecraft:air
setblock ~5 ~2 ~12 minecraft:air
setblock ~5 ~1 ~12 minecraft:spruce_door[half=lower,hinge=left,facing=north,open=false]
setblock ~5 ~2 ~12 minecraft:spruce_door[half=upper,hinge=left,facing=north,open=false]
# 裏口 外 植木鉢
setblock ~4 ~0 ~12 minecraft:potted_poppy
setblock ~6 ~0 ~12 minecraft:potted_poppy

# ============================================================
# 11. 1F → 2F 階段 (X=1~2, Z=6~10)
# ============================================================
setblock ~2 ~1 ~10 minecraft:spruce_stairs[facing=north,half=bottom]
setblock ~2 ~2 ~9  minecraft:spruce_stairs[facing=north,half=bottom]
setblock ~2 ~3 ~8  minecraft:spruce_stairs[facing=north,half=bottom]
setblock ~2 ~4 ~7  minecraft:spruce_stairs[facing=north,half=bottom]
# 階段 手すり
setblock ~1 ~2 ~10 minecraft:spruce_fence
setblock ~1 ~3 ~9  minecraft:spruce_fence
setblock ~1 ~4 ~8  minecraft:spruce_fence
setblock ~1 ~5 ~7  minecraft:spruce_fence
setblock ~1 ~5 ~6  minecraft:spruce_fence
# 階段下ランタン
setblock ~2 ~1 ~9 minecraft:torch

# ============================================================
# 12. 2F 居住区 床 (Y=5 = 2F歩行面 / 内装はY=6~)
# ============================================================
# 2F 内壁 (仕切り壁)
# 主寝室 ↔ 子供部屋 仕切り (Z=8)
fill ~1 ~6 ~8 ~9 ~6 ~8 minecraft:birch_planks
setblock ~5 ~6 ~8 minecraft:air
setblock ~5 ~7 ~8 minecraft:air
setblock ~4 ~6 ~8 minecraft:air
setblock ~4 ~7 ~8 minecraft:air

# ============================================================
# 13. 2F 主寝室 (Z=0~7)
# ============================================================
# 親のベッド (X=8~9, Z=1~2)
setblock ~8 ~6 ~1 minecraft:red_bed[part=foot,facing=north]
setblock ~8 ~6 ~2 minecraft:red_bed[part=head,facing=north]
setblock ~9 ~6 ~1 minecraft:red_bed[part=foot,facing=north]
setblock ~9 ~6 ~2 minecraft:red_bed[part=head,facing=north]
# ベッドサイド
setblock ~7 ~6 ~2 minecraft:barrel[facing=up]
setblock ~7 ~7 ~2 minecraft:lantern[hanging=false]
# 夫婦の収納棚
setblock ~1 ~6 ~1 minecraft:barrel[facing=east]
setblock ~1 ~6 ~2 minecraft:barrel[facing=east]
setblock ~1 ~7 ~1 minecraft:barrel[facing=east]
# 2F 南窓辺 (正面2F)
setblock ~2 ~7 ~0 minecraft:potted_poppy
setblock ~8 ~7 ~0 minecraft:potted_poppy
# ランタン
setblock ~5 ~8 ~3 minecraft:lantern[hanging=true]

# ============================================================
# 14. 2F 子供部屋 (Z=9~11)
# ============================================================
# ジェイドのベッド (X=8~9, Z=9)
setblock ~8 ~6 ~9  minecraft:cyan_bed[part=foot,facing=south]
setblock ~8 ~6 ~10 minecraft:cyan_bed[part=head,facing=south]
# カーネルのベッド (X=1~2, Z=9)
setblock ~1 ~6 ~9  minecraft:yellow_bed[part=foot,facing=south]
setblock ~1 ~6 ~10 minecraft:yellow_bed[part=head,facing=south]
# 子供用コーナー (本棚・遊び道具風)
setblock ~3 ~6 ~11 minecraft:bookshelf
setblock ~4 ~6 ~11 minecraft:bookshelf
setblock ~5 ~6 ~11 minecraft:lectern[facing=north]
# 子供の勉強机風
setblock ~6 ~6 ~11 minecraft:spruce_planks
setblock ~6 ~7 ~11 minecraft:item_frame[facing=south]
setblock ~7 ~6 ~11 minecraft:crafting_table
# トラップドア 遊び場風
setblock ~3 ~6 ~10 minecraft:spruce_trapdoor[facing=south,half=top,open=false]
setblock ~4 ~6 ~10 minecraft:spruce_trapdoor[facing=south,half=top,open=true]
# 子供部屋ランタン
setblock ~5 ~8 ~10 minecraft:lantern[hanging=true]
# 子供部屋 北窓辺
setblock ~3 ~7 ~12 minecraft:potted_poppy
setblock ~7 ~7 ~12 minecraft:potted_poppy

# ============================================================
# 15. 2F 食卓エリア (Z=5~7 中央)
# ============================================================
# 食卓
fill ~4 ~6 ~5 ~6 ~6 ~6 minecraft:spruce_planks
setblock ~5 ~6 ~5 minecraft:spruce_slab[type=top]
# 椅子 (trapdoor)
setblock ~3 ~6 ~5 minecraft:spruce_trapdoor[facing=east,half=bottom,open=false]
setblock ~7 ~6 ~5 minecraft:spruce_trapdoor[facing=west,half=bottom,open=false]
setblock ~3 ~6 ~6 minecraft:spruce_trapdoor[facing=east,half=bottom,open=false]
setblock ~7 ~6 ~6 minecraft:spruce_trapdoor[facing=west,half=bottom,open=false]
setblock ~5 ~6 ~7 minecraft:spruce_trapdoor[facing=north,half=bottom,open=false]
setblock ~5 ~6 ~4 minecraft:spruce_trapdoor[facing=south,half=bottom,open=false]
# テーブル上 ランタン
setblock ~5 ~8 ~6 minecraft:lantern[hanging=true]
# 小棚 (食器風)
setblock ~1 ~6 ~6 minecraft:barrel[facing=up]
setblock ~1 ~7 ~6 minecraft:item_frame[facing=east]
setblock ~9 ~6 ~6 minecraft:barrel[facing=up]
setblock ~9 ~7 ~5 minecraft:item_frame[facing=west]

# ============================================================
# 16. 正面外観 仕上げ
# ============================================================
# 正面入口 上 アーチ
fill ~3 ~3 ~0 ~6 ~3 ~0 minecraft:stone_brick_slab
# 正面 看板用アイテムフレーム
setblock ~4 ~4 ~0 minecraft:item_frame[facing=south]
setblock ~5 ~4 ~0 minecraft:item_frame[facing=south]
# 正面ランタン (左右 柱)
setblock ~3 ~2 ~0 minecraft:torch
setblock ~6 ~2 ~0 minecraft:torch
# 正面柱
setblock ~3 ~1 ~0 minecraft:stripped_spruce_log
setblock ~3 ~2 ~0 minecraft:stripped_spruce_log
setblock ~6 ~1 ~0 minecraft:stripped_spruce_log
setblock ~6 ~2 ~0 minecraft:stripped_spruce_log
# ランタン吊り
setblock ~4 ~4 ~-1 minecraft:lantern[hanging=true]
setblock ~5 ~4 ~-1 minecraft:lantern[hanging=true]
# 玄関前 花壇
setblock ~1 ~0 ~-1 minecraft:potted_poppy
setblock ~2 ~0 ~-1 minecraft:potted_poppy
setblock ~7 ~0 ~-1 minecraft:potted_poppy
setblock ~8 ~0 ~-1 minecraft:potted_poppy
setblock ~0 ~0 ~-1 minecraft:potted_poppy
setblock ~9 ~0 ~-1 minecraft:potted_poppy

say Leonhart Bakery build done
