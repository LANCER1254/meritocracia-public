say Meritocracia GrandCentral build start

# ============================================================
# グランセントラル 縮小ミニチュア都市
# 基準: プレイヤー足元 (~0 ~0 ~0)
# Y=0 が地面レベル
#
# 区画配置 (俯瞰)
#   [港湾物流区]  [行政中枢区]  [東住宅区]
#              [中央市場区]
#          [士官予備区][教会旧市街]
# ============================================================

# ============================================================
# 0. 地面 基盤整地 (Y=-1 に底面、Y=0 が歩行面)
# ============================================================
fill ~-52 ~-1 ~-36 ~52 ~-1 ~36 minecraft:dirt
fill ~-52 ~0  ~-36 ~52 ~0  ~36 minecraft:gravel

# ============================================================
# 1. 中央市場区  (中心: ~0 ~0 ~0  範囲: X -12~12 Z -12~12)
# ============================================================
# 石畳広場
fill ~-12 ~0 ~-12 ~12 ~0 ~12 minecraft:stone_bricks
fill ~-10 ~0 ~-10 ~10 ~0 ~10 minecraft:chiseled_stone_bricks
# 中央噴水台 (stone slab積み)
fill ~-2 ~0 ~-2 ~2 ~0 ~2 minecraft:stone_brick_slab
setblock ~0 ~1 ~0 minecraft:stone_brick_slab
# 噴水水源
setblock ~0 ~2 ~0 minecraft:water
setblock ~-1 ~1 ~-1 minecraft:stone_brick_slab
setblock ~1 ~1 ~-1 minecraft:stone_brick_slab
setblock ~-1 ~1 ~1 minecraft:stone_brick_slab
setblock ~1 ~1 ~1 minecraft:stone_brick_slab
# 広場ランタン (四隅)
setblock ~-9 ~0 ~-9 minecraft:stone_brick_slab
setblock ~-9 ~1 ~-9 minecraft:lantern
setblock ~9 ~0 ~-9 minecraft:stone_brick_slab
setblock ~9 ~1 ~-9 minecraft:lantern
setblock ~-9 ~0 ~9 minecraft:stone_brick_slab
setblock ~-9 ~1 ~9 minecraft:lantern
setblock ~9 ~0 ~9 minecraft:stone_brick_slab
setblock ~9 ~1 ~9 minecraft:lantern
# 屋台 (木製) 北側
fill ~-8 ~0 ~-11 ~-5 ~0 ~-11 minecraft:oak_planks
fill ~-8 ~1 ~-11 ~-5 ~2 ~-11 minecraft:oak_planks
fill ~-8 ~3 ~-11 ~-5 ~3 ~-9  minecraft:oak_slab
setblock ~-8 ~1 ~-10 minecraft:air
setblock ~-7 ~1 ~-10 minecraft:air
setblock ~-6 ~1 ~-10 minecraft:air
setblock ~-6 ~2 ~-10 minecraft:torch
# 屋台 南側
fill ~5 ~0 ~11 ~8 ~0 ~11 minecraft:spruce_planks
fill ~5 ~1 ~11 ~8 ~2 ~11 minecraft:spruce_planks
fill ~5 ~3 ~11 ~8 ~3 ~9  minecraft:spruce_slab
setblock ~5 ~1 ~10 minecraft:air
setblock ~6 ~1 ~10 minecraft:air
setblock ~7 ~1 ~10 minecraft:air
setblock ~7 ~2 ~10 minecraft:torch
# 屋台 東側
fill ~11 ~0 ~-5 ~11 ~0 ~-2 minecraft:birch_planks
fill ~11 ~1 ~-5 ~11 ~2 ~-2 minecraft:birch_planks
fill ~9  ~3 ~-5 ~11 ~3 ~-2 minecraft:birch_slab
setblock ~10 ~1 ~-4 minecraft:air
setblock ~10 ~1 ~-3 minecraft:air
setblock ~10 ~2 ~-3 minecraft:torch
# 広場フラッグポール (中央北)
setblock ~0 ~0 ~-11 minecraft:oak_fence
setblock ~0 ~1 ~-11 minecraft:oak_fence
setblock ~0 ~2 ~-11 minecraft:oak_fence
setblock ~0 ~3 ~-11 minecraft:oak_fence
setblock ~0 ~4 ~-11 minecraft:oak_fence
setblock ~0 ~5 ~-11 minecraft:torch

# ============================================================
# 2. 大通り (中央から各区画への接続道)
# ============================================================
# 北道 (中央→行政中枢区)
fill ~-2 ~0 ~-12 ~2 ~0 ~-36 minecraft:stone_bricks
fill ~-1 ~0 ~-13 ~1 ~0 ~-35 minecraft:cobblestone
# 南道 (中央→士官予備区・教会旧市街)
fill ~-2 ~0 ~12  ~2 ~0 ~36  minecraft:stone_bricks
fill ~-1 ~0 ~13  ~1 ~0 ~35  minecraft:cobblestone
# 西道 (中央→港湾物流区)
fill ~-12 ~0 ~-2 ~-36 ~0 ~2 minecraft:cobblestone
fill ~-13 ~0 ~-1 ~-35 ~0 ~1 minecraft:gravel
# 東道 (中央→東住宅区)
fill ~12 ~0 ~-2 ~36 ~0 ~2   minecraft:stone_bricks
fill ~13 ~0 ~-1 ~35 ~0 ~1   minecraft:cobblestone
# 斜め接続道 (行政→東住宅)
fill ~12 ~0 ~-20 ~22 ~0 ~-12 minecraft:cobblestone
# 斜め接続道 (士官→教会)
fill ~8  ~0 ~16  ~18 ~0 ~24  minecraft:gravel
# 道沿いランタン
setblock ~0 ~1 ~-20 minecraft:lantern
setblock ~0 ~1 ~-28 minecraft:lantern
setblock ~0 ~1 ~20  minecraft:lantern
setblock ~0 ~1 ~28  minecraft:lantern
setblock ~-20 ~1 ~0 minecraft:lantern
setblock ~-28 ~1 ~0 minecraft:lantern
setblock ~20  ~1 ~0 minecraft:lantern
setblock ~28  ~1 ~0 minecraft:lantern

# ============================================================
# 3. 行政中枢区  (中心: ~0 ~0 ~-26  範囲: X -14~14 Z -36~-18)
# ============================================================
# 地面
fill ~-14 ~0 ~-36 ~14 ~0 ~-18 minecraft:smooth_stone
fill ~-12 ~0 ~-34 ~12 ~0 ~-20 minecraft:stone_bricks
# 庁舎 本体
fill ~-8 ~0 ~-34 ~8  ~0 ~-22 minecraft:stone_bricks
fill ~-8 ~1 ~-34 ~8  ~5 ~-22 minecraft:stone_bricks
fill ~-7 ~1 ~-33 ~7  ~4 ~-23 minecraft:air
fill ~-8 ~6 ~-34 ~8  ~6 ~-22 minecraft:deepslate_tile_slab
# 屋根 (deepslate)
fill ~-8 ~7 ~-34 ~8  ~7 ~-22 minecraft:deepslate_tiles
# 旗竿
setblock ~0  ~7 ~-34 minecraft:oak_fence
setblock ~0  ~8 ~-34 minecraft:oak_fence
setblock ~0  ~9 ~-34 minecraft:torch
# 入口
setblock ~0  ~1 ~-22 minecraft:air
setblock ~0  ~2 ~-22 minecraft:air
setblock ~0  ~3 ~-22 minecraft:iron_bars
# 窓 (両側)
setblock ~-5 ~3 ~-34 minecraft:glass_pane
setblock ~-3 ~3 ~-34 minecraft:glass_pane
setblock ~3  ~3 ~-34 minecraft:glass_pane
setblock ~5  ~3 ~-34 minecraft:glass_pane
setblock ~-5 ~3 ~-22 minecraft:glass_pane
setblock ~-3 ~3 ~-22 minecraft:glass_pane
setblock ~3  ~3 ~-22 minecraft:glass_pane
setblock ~5  ~3 ~-22 minecraft:glass_pane
setblock ~-8 ~3 ~-30 minecraft:glass_pane
setblock ~-8 ~3 ~-28 minecraft:glass_pane
setblock ~8  ~3 ~-30 minecraft:glass_pane
setblock ~8  ~3 ~-28 minecraft:glass_pane
# 庁舎前 広場・柵
fill ~-12 ~0 ~-21 ~12 ~0 ~-19 minecraft:smooth_stone
fill ~-12 ~1 ~-19 ~12 ~1 ~-19 minecraft:stone_brick_wall
setblock ~0  ~1 ~-19 minecraft:air
setblock ~-12 ~1 ~-19 minecraft:torch
setblock ~12  ~1 ~-19 minecraft:torch
# 詰所 (小建物 右)
fill ~10 ~0 ~-34 ~14 ~0 ~-28 minecraft:cobblestone
fill ~10 ~1 ~-34 ~14 ~3 ~-28 minecraft:cobblestone
fill ~10 ~4 ~-34 ~14 ~4 ~-28 minecraft:stone_brick_slab
setblock ~12 ~1 ~-28 minecraft:air
setblock ~12 ~2 ~-28 minecraft:air
setblock ~11 ~2 ~-32 minecraft:torch
# 詰所 (小建物 左)
fill ~-14 ~0 ~-34 ~-10 ~0 ~-28 minecraft:cobblestone
fill ~-14 ~1 ~-34 ~-10 ~3 ~-28 minecraft:cobblestone
fill ~-14 ~4 ~-34 ~-10 ~4 ~-28 minecraft:stone_brick_slab
setblock ~-12 ~1 ~-28 minecraft:air
setblock ~-12 ~2 ~-28 minecraft:air
setblock ~-13 ~2 ~-32 minecraft:torch

# ============================================================
# 4. 東住宅区  (中心: ~26 ~0 ~-8  範囲: X 18~38 Z -20~4)
# ============================================================
# 地面
fill ~18 ~0 ~-20 ~38 ~0 ~4 minecraft:grass_block
fill ~18 ~0 ~-18 ~38 ~0 ~2 minecraft:dirt_path
# 住宅 A (北西)
fill ~20 ~0 ~-18 ~26 ~0 ~-12 minecraft:oak_planks
fill ~20 ~1 ~-18 ~26 ~3 ~-12 minecraft:oak_planks
fill ~20 ~4 ~-18 ~26 ~4 ~-12 minecraft:spruce_slab
setblock ~23 ~1 ~-12 minecraft:air
setblock ~23 ~2 ~-12 minecraft:air
setblock ~21 ~2 ~-16 minecraft:glass_pane
setblock ~25 ~2 ~-16 minecraft:glass_pane
setblock ~23 ~3 ~-12 minecraft:oak_door[half=lower,hinge=left,facing=south]
# 住宅 B (北東)
fill ~28 ~0 ~-18 ~36 ~0 ~-12 minecraft:birch_planks
fill ~28 ~1 ~-18 ~36 ~3 ~-12 minecraft:birch_planks
fill ~28 ~4 ~-18 ~36 ~4 ~-12 minecraft:birch_slab
setblock ~32 ~1 ~-12 minecraft:air
setblock ~32 ~2 ~-12 minecraft:air
setblock ~29 ~2 ~-16 minecraft:glass_pane
setblock ~35 ~2 ~-16 minecraft:glass_pane
# 住宅 C (南)
fill ~22 ~0 ~-6 ~30 ~0 ~2 minecraft:spruce_planks
fill ~22 ~1 ~-6 ~30 ~3 ~2 minecraft:spruce_planks
fill ~22 ~4 ~-6 ~30 ~4 ~2 minecraft:spruce_slab
setblock ~26 ~1 ~2 minecraft:air
setblock ~26 ~2 ~2 minecraft:air
setblock ~23 ~2 ~-2 minecraft:glass_pane
setblock ~29 ~2 ~-2 minecraft:glass_pane
# 井戸
setblock ~34 ~0 ~-2 minecraft:cobblestone_slab
setblock ~33 ~0 ~-2 minecraft:cobblestone_slab
setblock ~35 ~0 ~-2 minecraft:cobblestone_slab
setblock ~33 ~0 ~-3 minecraft:cobblestone_slab
setblock ~35 ~0 ~-3 minecraft:cobblestone_slab
setblock ~33 ~0 ~-1 minecraft:cobblestone_slab
setblock ~35 ~0 ~-1 minecraft:cobblestone_slab
setblock ~34 ~0 ~-2 minecraft:water
setblock ~34 ~1 ~-2 minecraft:air
setblock ~33 ~1 ~-3 minecraft:oak_fence
setblock ~35 ~1 ~-3 minecraft:oak_fence
setblock ~33 ~1 ~-1 minecraft:oak_fence
setblock ~35 ~1 ~-1 minecraft:oak_fence
setblock ~34 ~2 ~-3 minecraft:oak_fence
setblock ~34 ~2 ~-1 minecraft:oak_fence
# 畑
fill ~33 ~0 ~-16 ~37 ~0 ~-13 minecraft:farmland
setblock ~33 ~1 ~-16 minecraft:wheat[age=7]
setblock ~34 ~1 ~-16 minecraft:wheat[age=5]
setblock ~35 ~1 ~-16 minecraft:wheat[age=7]
setblock ~36 ~1 ~-16 minecraft:wheat[age=3]
setblock ~37 ~1 ~-16 minecraft:wheat[age=6]
setblock ~33 ~1 ~-15 minecraft:wheat[age=4]
setblock ~34 ~1 ~-15 minecraft:carrots[age=7]
setblock ~35 ~1 ~-15 minecraft:carrots[age=5]
setblock ~36 ~1 ~-15 minecraft:wheat[age=7]
setblock ~37 ~1 ~-15 minecraft:wheat[age=2]
setblock ~33 ~1 ~-14 minecraft:wheat[age=6]
setblock ~34 ~1 ~-14 minecraft:wheat[age=7]
setblock ~35 ~1 ~-14 minecraft:potatoes[age=7]
setblock ~36 ~1 ~-14 minecraft:potatoes[age=5]
setblock ~37 ~1 ~-14 minecraft:wheat[age=4]
setblock ~33 ~1 ~-13 minecraft:wheat[age=7]
setblock ~34 ~1 ~-13 minecraft:wheat[age=3]
setblock ~35 ~1 ~-13 minecraft:wheat[age=7]
setblock ~36 ~1 ~-13 minecraft:wheat[age=6]
setblock ~37 ~1 ~-13 minecraft:wheat[age=7]
# 街灯
setblock ~19 ~1 ~-10 minecraft:lantern
setblock ~19 ~0 ~-10 minecraft:stone_brick_slab
setblock ~37 ~1 ~-10 minecraft:lantern
setblock ~37 ~0 ~-10 minecraft:stone_brick_slab
setblock ~28 ~1 ~3   minecraft:lantern
setblock ~28 ~0 ~3   minecraft:stone_brick_slab
# 木 (生活感)
setblock ~36 ~0 ~-8  minecraft:oak_log
setblock ~36 ~1 ~-8  minecraft:oak_log
setblock ~36 ~2 ~-8  minecraft:oak_log
setblock ~35 ~3 ~-8  minecraft:oak_leaves[persistent=true]
setblock ~36 ~3 ~-8  minecraft:oak_leaves[persistent=true]
setblock ~37 ~3 ~-8  minecraft:oak_leaves[persistent=true]
setblock ~35 ~3 ~-9  minecraft:oak_leaves[persistent=true]
setblock ~36 ~3 ~-9  minecraft:oak_leaves[persistent=true]
setblock ~37 ~3 ~-9  minecraft:oak_leaves[persistent=true]
setblock ~35 ~3 ~-7  minecraft:oak_leaves[persistent=true]
setblock ~36 ~3 ~-7  minecraft:oak_leaves[persistent=true]
setblock ~37 ~3 ~-7  minecraft:oak_leaves[persistent=true]
setblock ~36 ~4 ~-8  minecraft:oak_leaves[persistent=true]

# ============================================================
# 5. 士官予備区  (中心: ~-8 ~0 ~24  範囲: X -22~6 Z 14~34)
# ============================================================
# 地面
fill ~-22 ~0 ~14 ~6 ~0 ~34 minecraft:blackstone
fill ~-20 ~0 ~16 ~4 ~0 ~32 minecraft:cracked_stone_bricks
# 訓練場 仕切り柵
fill ~-20 ~1 ~16 ~-20 ~1 ~32 minecraft:blackstone_wall
fill ~4   ~1 ~16 ~4   ~1 ~32 minecraft:blackstone_wall
fill ~-20 ~1 ~16 ~4   ~1 ~16 minecraft:blackstone_wall
setblock ~-8 ~1 ~16 minecraft:air
setblock ~-8 ~1 ~32 minecraft:air
# 訓練場内 (砂)
fill ~-19 ~0 ~17 ~3 ~0 ~31 minecraft:sand
# 的 (target block 代わりに石レンガ+看板スタイル)
fill ~-16 ~1 ~30 ~-14 ~3 ~30 minecraft:chiseled_stone_bricks
fill ~-16 ~4 ~30 ~-14 ~4 ~30 minecraft:stone_brick_slab
setblock ~-15 ~1 ~29 minecraft:red_wool
setblock ~-15 ~2 ~29 minecraft:white_wool
setblock ~-15 ~3 ~29 minecraft:red_wool
# 武器ラック風 (柵+旗)
setblock ~-4 ~0 ~22 minecraft:oak_fence
setblock ~-4 ~1 ~22 minecraft:oak_fence
setblock ~-3 ~0 ~22 minecraft:oak_fence
setblock ~-3 ~1 ~22 minecraft:oak_fence
setblock ~-2 ~0 ~22 minecraft:oak_fence
setblock ~-2 ~1 ~22 minecraft:oak_fence
setblock ~-1 ~0 ~22 minecraft:oak_fence
setblock ~-1 ~1 ~22 minecraft:oak_fence
setblock ~0  ~0 ~22 minecraft:oak_fence
setblock ~0  ~1 ~22 minecraft:oak_fence
# 訓練校 建物
fill ~-22 ~0 ~14 ~-14 ~0 ~16 minecraft:blackstone
fill ~-22 ~1 ~14 ~-14 ~4 ~16 minecraft:blackstone
fill ~-22 ~5 ~14 ~-14 ~5 ~16 minecraft:deepslate_tile_slab
setblock ~-18 ~1 ~14 minecraft:air
setblock ~-18 ~2 ~14 minecraft:air
setblock ~-16 ~2 ~16 minecraft:torch
setblock ~-20 ~3 ~16 minecraft:glass_pane
setblock ~-16 ~3 ~16 minecraft:glass_pane
# 鍛錬塔
fill ~2 ~0 ~14 ~6 ~0 ~17 minecraft:blackstone
fill ~2 ~1 ~14 ~6 ~6 ~17 minecraft:blackstone
fill ~2 ~7 ~14 ~6 ~7 ~17 minecraft:blackstone_slab
setblock ~4 ~1 ~14 minecraft:air
setblock ~4 ~2 ~14 minecraft:air
setblock ~4 ~5 ~17 minecraft:torch
# ランタン
setblock ~-20 ~1 ~32 minecraft:lantern
setblock ~4   ~1 ~32 minecraft:lantern
setblock ~-8  ~1 ~32 minecraft:lantern

# ============================================================
# 6. 教会旧市街  (中心: ~16 ~0 ~26  範囲: X 6~30 Z 16~36)
# ============================================================
# 地面
fill ~6 ~0 ~16 ~30 ~0 ~36 minecraft:cobblestone
fill ~8 ~0 ~18 ~28 ~0 ~34 minecraft:stone_bricks
# 礼拝堂 本体
fill ~14 ~0 ~18 ~24 ~0 ~32 minecraft:cobblestone
fill ~14 ~1 ~18 ~24 ~6 ~32 minecraft:cobblestone
fill ~15 ~2 ~19 ~23 ~5 ~31 minecraft:air
fill ~14 ~7 ~18 ~24 ~7 ~32 minecraft:cobblestone_slab
# 尖塔
fill ~18 ~0 ~18 ~20 ~0 ~20 minecraft:cobblestone
fill ~18 ~7 ~18 ~20 ~12 ~20 minecraft:cobblestone
fill ~18 ~13 ~18 ~20 ~13 ~20 minecraft:cobblestone_slab
setblock ~19 ~14 ~19 minecraft:lightning_rod
# 入口
setblock ~19 ~1 ~32 minecraft:air
setblock ~19 ~2 ~32 minecraft:air
setblock ~19 ~3 ~32 minecraft:iron_bars
setblock ~18 ~3 ~32 minecraft:iron_bars
setblock ~20 ~3 ~32 minecraft:iron_bars
# 礼拝堂 窓 (ステンドグラス風)
setblock ~16 ~4 ~18 minecraft:purple_stained_glass
setblock ~22 ~4 ~18 minecraft:purple_stained_glass
setblock ~14 ~4 ~24 minecraft:purple_stained_glass
setblock ~24 ~4 ~24 minecraft:purple_stained_glass
setblock ~14 ~4 ~28 minecraft:purple_stained_glass
setblock ~24 ~4 ~28 minecraft:purple_stained_glass
setblock ~16 ~4 ~32 minecraft:purple_stained_glass
setblock ~22 ~4 ~32 minecraft:purple_stained_glass
setblock ~19 ~5 ~18 minecraft:purple_stained_glass
setblock ~19 ~5 ~32 minecraft:purple_stained_glass
# 鐘楼 (礼拝堂左隣)
fill ~10 ~0 ~24 ~13 ~0 ~27 minecraft:stone_bricks
fill ~10 ~1 ~24 ~13 ~6 ~27 minecraft:stone_bricks
fill ~10 ~7 ~24 ~13 ~7 ~27 minecraft:stone_brick_slab
setblock ~11 ~5 ~24 minecraft:air
setblock ~11 ~6 ~24 minecraft:air
setblock ~12 ~5 ~24 minecraft:air
setblock ~12 ~6 ~24 minecraft:air
setblock ~11 ~5 ~25 minecraft:bell
# 墓石風 (石碑)
setblock ~8  ~1 ~30 minecraft:cobblestone_wall
setblock ~9  ~1 ~30 minecraft:cobblestone_wall
setblock ~8  ~1 ~28 minecraft:cobblestone_wall
setblock ~9  ~1 ~28 minecraft:cobblestone_wall
setblock ~8  ~1 ~26 minecraft:cobblestone_wall
# 礼拝堂前 広場 + ランタン
fill ~14 ~0 ~32 ~24 ~0 ~36 minecraft:stone_bricks
setblock ~14 ~1 ~34 minecraft:lantern
setblock ~24 ~1 ~34 minecraft:lantern
setblock ~19 ~1 ~36 minecraft:lantern
# 地下礼拝路入口 (地下へのはしご)
setblock ~26 ~0 ~32 minecraft:cobblestone_stairs[facing=north]
setblock ~26 ~-1 ~32 minecraft:ladder[facing=north]
setblock ~26 ~-2 ~32 minecraft:ladder[facing=north]
setblock ~26 ~-3 ~32 minecraft:cobblestone
setblock ~25 ~-3 ~32 minecraft:torch
# 周囲ランタン
setblock ~6  ~1 ~18 minecraft:lantern
setblock ~6  ~0 ~18 minecraft:stone_brick_slab
setblock ~30 ~1 ~18 minecraft:lantern
setblock ~30 ~0 ~18 minecraft:stone_brick_slab
setblock ~6  ~1 ~36 minecraft:lantern
setblock ~6  ~0 ~36 minecraft:stone_brick_slab
setblock ~30 ~1 ~36 minecraft:lantern
setblock ~30 ~0 ~36 minecraft:stone_brick_slab

# ============================================================
# 7. 港湾物流区  (中心: ~-36 ~0 ~0  範囲: X -52~-18 Z -16~16)
# ============================================================
# 地面
fill ~-52 ~0 ~-16 ~-18 ~0 ~16 minecraft:cobblestone
fill ~-50 ~0 ~-14 ~-20 ~0 ~14 minecraft:gravel
# 倉庫 A
fill ~-50 ~0 ~-12 ~-36 ~0 ~-2 minecraft:spruce_planks
fill ~-50 ~1 ~-12 ~-36 ~4 ~-2 minecraft:spruce_planks
fill ~-50 ~5 ~-12 ~-36 ~5 ~-2 minecraft:spruce_slab
setblock ~-43 ~1 ~-2 minecraft:air
setblock ~-43 ~2 ~-2 minecraft:air
setblock ~-43 ~3 ~-2 minecraft:air
setblock ~-44 ~2 ~-10 minecraft:torch
setblock ~-42 ~2 ~-10 minecraft:torch
# 倉庫 B
fill ~-50 ~0 ~2  ~-36 ~0 ~12 minecraft:spruce_planks
fill ~-50 ~1 ~2  ~-36 ~4 ~12 minecraft:spruce_planks
fill ~-50 ~5 ~2  ~-36 ~5 ~12 minecraft:spruce_slab
setblock ~-43 ~1 ~12 minecraft:air
setblock ~-43 ~2 ~12 minecraft:air
setblock ~-43 ~3 ~12 minecraft:air
setblock ~-44 ~2 ~10 minecraft:torch
setblock ~-42 ~2 ~10 minecraft:torch
# 桟橋
fill ~-52 ~0 ~-4 ~-52 ~0 ~4 minecraft:oak_planks
fill ~-52 ~-1 ~-4 ~-52 ~-2 ~4 minecraft:oak_log
setblock ~-52 ~1 ~-4 minecraft:oak_fence
setblock ~-52 ~1 ~4  minecraft:oak_fence
setblock ~-52 ~2 ~-4 minecraft:lantern
setblock ~-52 ~2 ~4  minecraft:lantern
# 荷積み台 (コンテナ風)
fill ~-34 ~0 ~-4 ~-30 ~2 ~-2 minecraft:oak_planks
fill ~-34 ~0 ~2  ~-30 ~2 ~4  minecraft:spruce_planks
fill ~-28 ~0 ~-6 ~-24 ~2 ~-4 minecraft:dark_oak_planks
# 魔石流通センター (小建物)
fill ~-34 ~0 ~-16 ~-20 ~0 ~-14 minecraft:blackstone
fill ~-34 ~1 ~-16 ~-20 ~3 ~-14 minecraft:blackstone
fill ~-34 ~4 ~-16 ~-20 ~4 ~-14 minecraft:blackstone_slab
setblock ~-27 ~1 ~-14 minecraft:air
setblock ~-27 ~2 ~-14 minecraft:air
setblock ~-26 ~2 ~-16 minecraft:torch
# 交易港 水面
fill ~-52 ~-1 ~-16 ~-52 ~-1 ~16 minecraft:water
fill ~-51 ~-1 ~-14 ~-51 ~-1 ~14 minecraft:water
fill ~-50 ~-1 ~-2  ~-50 ~-1 ~2  minecraft:water
# ランタン
setblock ~-18 ~1 ~-14 minecraft:lantern
setblock ~-18 ~1 ~14  minecraft:lantern
setblock ~-34 ~1 ~-14 minecraft:torch
setblock ~-34 ~1 ~14  minecraft:torch

# ============================================================
# 8. 旧城壁 (外周フェンス/壁)
# ============================================================
# 北壁
fill ~-14 ~1 ~-36 ~14 ~1 ~-36 minecraft:stone_brick_wall
fill ~-14 ~2 ~-36 ~14 ~2 ~-36 minecraft:stone_brick_wall
setblock ~0 ~1 ~-36 minecraft:air
setblock ~0 ~2 ~-36 minecraft:air
# 東壁
fill ~38 ~1 ~-20 ~38 ~1 ~4 minecraft:stone_brick_wall
fill ~38 ~2 ~-20 ~38 ~2 ~4 minecraft:stone_brick_wall
# 南壁
fill ~6 ~1 ~36 ~30 ~1 ~36 minecraft:stone_brick_wall
fill ~6 ~2 ~36 ~30 ~2 ~36 minecraft:stone_brick_wall
# 壁上 松明
setblock ~-14 ~3 ~-36 minecraft:torch
setblock ~14  ~3 ~-36 minecraft:torch
setblock ~38  ~3 ~-20 minecraft:torch
setblock ~38  ~3 ~4   minecraft:torch
setblock ~6   ~3 ~36  minecraft:torch
setblock ~30  ~3 ~36  minecraft:torch

# ============================================================
# 9. 馬車停留所 (大通り沿い 3か所)
# ============================================================
# 北停留所
fill ~-4 ~0 ~-17 ~4 ~0 ~-16 minecraft:smooth_stone
fill ~-4 ~1 ~-17 ~4 ~3 ~-16 minecraft:oak_planks
fill ~-4 ~4 ~-18 ~4 ~4 ~-15 minecraft:spruce_slab
setblock ~-3 ~1 ~-17 minecraft:air
setblock ~3  ~1 ~-17 minecraft:air
setblock ~0  ~2 ~-17 minecraft:air
setblock ~-3 ~3 ~-16 minecraft:torch
setblock ~3  ~3 ~-16 minecraft:torch
# 東停留所
fill ~13 ~0 ~-4 ~14 ~0 ~4 minecraft:smooth_stone
fill ~13 ~1 ~-4 ~14 ~3 ~4 minecraft:oak_planks
fill ~12 ~4 ~-4 ~15 ~4 ~4 minecraft:spruce_slab
setblock ~13 ~1 ~0 minecraft:air
setblock ~14 ~1 ~0 minecraft:air
setblock ~12 ~3 ~-3 minecraft:torch
setblock ~12 ~3 ~3  minecraft:torch
# 南停留所
fill ~-4 ~0 ~13 ~4 ~0 ~14 minecraft:smooth_stone
fill ~-4 ~1 ~13 ~4 ~3 ~14 minecraft:oak_planks
fill ~-4 ~4 ~12 ~4 ~4 ~15 minecraft:spruce_slab
setblock ~-3 ~1 ~13 minecraft:air
setblock ~3  ~1 ~13 minecraft:air
setblock ~0  ~2 ~13 minecraft:air
setblock ~-3 ~3 ~14 minecraft:torch
setblock ~3  ~3 ~14 minecraft:torch

say Meritocracia GrandCentral build done
