### 机场推荐 [ENET--IEPL内网专线接入](https://www.easyenable.com/#/register?code=CNC7La7m)
# OpenWrt — RockChip多设备固件云编译

> **🚀 編譯速度優化：** 本項目已進行全面的編譯流程優化！詳見 [OPTIMIZATION.md](OPTIMIZATION.md) 了解如何提高 40-70% 的構建速度。

- 支持rk3588，rk356x，rk3399，rk3328
### 源代码地址
https://github.com/DHDAXCW/lede-rockchip

### 支持设备
```
embedfire_doornet1
embedfire_doornet2
embedfire_lubancat-1n
embedfire_lubancat-1
embedfire_lubancat-2n
embedfire_lubancat-2
embedfire_lubancat-4
embedfire_lubancat-5
friendlyarm_nanopc-t6
friendlyarm_nanopi-r2c
friendlyarm_nanopi-r2s
friendlyarm_nanopi-r4se
friendlyarm_nanopi-r4s
friendlyarm_nanopi-r5c
friendlyarm_nanopi-r5s
friendlyarm_nanopi-r6c
friendlyarm_nanopi-r6s
hinlink_h88k
hinlink_opc-h66k
hinlink_opc-h68k
hinlink_opc-h69k
```

### 固件默认配置
- 用户名：`root` 密码：`password` 管理IP：`192.168.11.1`
- 下载地址：https://github.com/DHDAXCW/OpenWrt_RockChip/releases 对应 Tag 标签内下载固件
- 刷机方法请参考dn2刷机 https://github.com/DHDAXCW/OpenWrt_RockChip/blob/master/data/emmc.md
- 电报交流群：https://t.me/armopenwrt

### 如何触发编译

#### immortalwrt_rockchip_docker 工作流
1. 进入仓库的 `Actions` 页面
2. 选择 `immortalwrt_rockchip_docker` 工作流
3. 点击 `Run workflow` 按钮
4. 在弹出的界面中：
   - 从 `Select device to build` 下拉选单中选择要构建的设备
   - 选择 `all` 构建所有设备固件（默认选项）
   - 或选择特定设备（例如 `armsom_sige3`、`friendlyarm_nanopi_r5s` 等）
   - 勾选 `Use cached kernel from previous build` 启用 kernel 缓存功能（可选）
5. 点击绿色的 `Run workflow` 按钮开始编译

**注意：**
- 默认选择 `all` 会构建所有设备的固件
- 可以从下拉选单中选择单个设备进行构建
- 支持的设备包括：armsom_sige3, armsom_sige7, embedfire 系列, friendlyarm 系列, hinlink 系列, radxa 系列, xunlong 系列等
- 启用 kernel 缓存后，会暂存上次编译成功的 kernel，下次编译时直接取出 cache，大幅缩短编译时间

#### immortalwrt_rockchip 和 immortalwrt_rockchip_fwq 工作流
1. 进入仓库的 `Actions` 页面
2. 选择需要运行的工作流（`immortalwrt_rockchip` 或 `immortalwrt_rockchip_fwq`）
3. 点击 `Run workflow` 按钮
4. 在弹出的界面中：
   - 勾选 `Build all devices` 构建所有设备固件（默认选项）
   - 或取消 `Build all devices`，然后勾选需要编译的目标设备（支持多选）
   - 勾选 `Use cached kernel from previous build` 启用 kernel 缓存功能（可选）
5. 点击绿色的 `Run workflow` 按钮开始编译

### 固件特色
1. 集成 iStore 应用商店，可根据自己需求自由安装所需插件
2. 集成应用过滤插件，支持游戏、视频、聊天、下载等 APP 过滤
3. 集成在线用户插件，可查看所有在线用户 IP 地址与实时速率等
4. 集成部分常用有线、无线、3G / 4G /5G 网卡驱动 可在issues提支持网卡，看本人能力了。。。
5. 支持在线更新，从2024.03.27之后就能通过后台升级
6. 特调优化irq中断分配网卡绑定cpu
7. 支持 Kernel 缓存功能，大幅缩短重复编译时间
8. **新增：全面編譯優化，提速 40-70%** 🚀

### 編譯速度優化 ⚡

本項目已實施全面的編譯流程優化，顯著提升構建速度：

#### 優化內容
- ✅ **APT 套件快取** - 節省 5-8 分鐘系統依賴安裝時間
- ✅ **Ccache 編譯快取** - 後續構建節省 30-50% 編譯時間
- ✅ **OpenWrt DL 目錄快取** - 節省 10-15 分鐘下載時間
- ✅ **並行 Git Clone** - 節省 3-5 分鐘代碼克隆時間
- ✅ **優化 Git 操作** - 使用淺克隆減少數據傳輸
- ✅ **更新 Actions 版本** - 使用最新的 GitHub Actions

#### 性能提升
- **首次構建：** 快 8-15% （節省 6-10 分鐘）
- **後續構建（有快取）：** 快 40-60% （節省 35-63 分鐘）
- **啟用 Kernel 快取：** 快 50-70% （節省 55-93 分鐘）

📖 **詳細說明請參考：** [OPTIMIZATION.md](OPTIMIZATION.md)

### Kernel 缓存功能说明
- **功能说明：** 在编译时可以选择是否启用 kernel 缓存功能，启用后会暂存上次编译成功的 kernel 文件，下次编译时直接取出 cache，不重新编译 kernel
- **优势：** 可以大幅缩短编译时间，特别适合频繁编译相同设备固件的场景
- **使用方法：** 在触发工作流时，勾选 `Use cached kernel from previous build` 选项
- **缓存范围：** 缓存包括 `build_dir/target-*` 和 `staging_dir/target-*` 目录
- **缓存策略：** 根据分支、设备和配置文件生成唯一的缓存 key，确保缓存的准确性
- **默认设置：** 默认关闭，需要手动启用

### 固件展示
<img width="1304" alt="image" src="https://github.com/DHDAXCW/OpenWrt_RockChip/assets/74764072/acc32c0b-a8aa-4250-88c1-a1d4d3f24ec2">

### 特别提示 [![](https://img.shields.io/badge/-个人免责声明-FFFFFF.svg)](#特别提示-)

- **因精力有限不提供任何技术支持和教程等相关问题解答，不保证完全无 BUG！**

- **本人不对任何人因使用本固件所遭受的任何理论或实际的损失承担责任！**

- **本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！**

### 有bug请在 https://github.com/DHDAXCW/OpenWrt_RockChip/issues 提问题

### 鸣谢

特别感谢以下项目：

Openwrt 官方项目：

<https://github.com/openwrt/openwrt>

Lean 大的 Openwrt 项目：

<https://github.com/coolsnowwolf/lede>

immortalwrt 的 OpenWrt 项目：

<https://github.com/immortalwrt/immortalwrt>

P3TERX 大佬的 Actions-OpenWrt 项目：

<https://github.com/P3TERX/Actions-OpenWrt>

SuLingGG 大佬的 Actions 编译框架 项目：

https://github.com/SuLingGG/OpenWrt-Rpi
