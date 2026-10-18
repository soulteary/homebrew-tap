# soulteary/homebrew-tap

soulteary 的个人 [Homebrew](https://brew.sh/) Tap,收录一些自用的命令行工具。

## 添加 Tap

```bash
brew tap soulteary/tap
```

添加后即可用 `brew install <formula>` 安装下列任意工具。

## 可用工具

| 工具 | 说明 | 版本 | 平台 | 项目主页 | 安装命令 |
| --- | --- | --- | --- | --- | --- |
| `splitdns` | 在 macOS 上安全地管理基于后缀(suffix)的 Split DNS 的命令行工具。 | `1.1.1` | macOS 13+(arm64 / amd64) | [soulteary/splitdns](https://github.com/soulteary/splitdns) | `brew install soulteary/tap/splitdns` |
| `portmap` | 用 Go 实现的通用 TCP/UDP 端口转发小工具,无需依赖系统 `socat`。 | `1.3.1` | macOS 13+ / Linux(arm64 / amd64) | [soulteary/portmap](https://github.com/soulteary/portmap) | `brew install soulteary/tap/portmap` |
| `otterio` | 兼容 S3 协议的对象存储服务。 | `2026-10-10T16-38-05Z` | macOS 13+ / Linux(arm64 / amd64 / ppc64le) | [soulteary/otterio](https://github.com/soulteary/otterio) | `brew install soulteary/tap/otterio` |
| `ssh-config` | 管理 SSH 配置,支持与 YAML/JSON 相互转换。 | `3.2.0` | macOS / Linux(arm64 / amd64) | [soulteary/ssh-config](https://github.com/soulteary/ssh-config) | `brew install soulteary/tap/ssh-config` |
| `nginx-formatter` | 小巧易用的 Nginx 配置格式化工具(CLI & WebUI),体积约 10MB。 | `2.6.2` | macOS 13+ / Linux(arm64 / amd64) | [soulteary/nginx-formatter](https://github.com/soulteary/nginx-formatter) | `brew install soulteary/tap/nginx-formatter` |
| `grantseal` | 基于 Ed25519 的零依赖离线软件授权协议与 CLI(签发端 `license-tool`)。 | `1.1.2` | macOS 13+ / Linux(arm64 / amd64) | [soulteary/grantseal](https://github.com/soulteary/grantseal) | `brew install soulteary/tap/grantseal` |
| `webhook` | 面向自托管和边缘环境的安全、可观测 webhook-to-command runner。 | `7.3.2` | macOS / Linux | [soulteary/webhook](https://github.com/soulteary/webhook) | `brew install soulteary/tap/webhook` |
| `starbridge` | 通过 CLI 和 MCP 管理 Parallels 虚拟机及 Windows 开发环境。 | `0.1.0` | macOS 13+(arm64 / amd64) | [soulteary/starbridge](https://github.com/soulteary/starbridge) | `brew install soulteary/tap/starbridge` |

## 可用桌面应用(Cask)

| 应用 | 说明 | 版本 | 平台 | 项目主页 | 安装命令 |
| --- | --- | --- | --- | --- | --- |
| `kakapo` | 更聪明的跨语言桌面翻译器,支持多服务商、多模型、多目标语言并行对比。 | `2026.10.11` | macOS 13+(universal) | [soulteary/kakapo](https://github.com/soulteary/kakapo) | `brew install --cask soulteary/tap/kakapo` |

## Starbridge 配套文件

Starbridge 使用上游发布的 arm64 / amd64 安装包，无需安装 Go。完整的 Windows helper、文档、示例、测试与许可保留在 `$(brew --prefix starbridge)/libexec`，命令通过 `bin` 中的链接运行；[安装与使用说明](https://github.com/soulteary/starbridge/blob/v0.1.0/docs/USAGE.md)也随包提供。

VM 管理需要具备 CLI 支持的 Parallels Desktop；Windows guest 动作还需要 Parallels Tools 和显式安装的配套 helper。Homebrew 不会安装 Parallels、向 Windows 复制文件或启动虚拟机。默认 helper 入口位于 Windows 的 `C:\ProgramData\Starbridge`，不是宿主的安装目录。

使用 `bootstrap.install` 时，`source_dir` 必须是完整 `guest/windows` 的物理绝对路径，路径中不能包含符号链接。Homebrew 的 `opt` 路径通常是链接，请先解析再填入安装请求：

```sh
helper_source=$(cd "$(brew --prefix starbridge)/libexec/guest/windows" && pwd -P)
printf '%s\n' "$helper_source"
```

该命令只显示本机配套文件路径；安装请求格式及手动安装方式见[上游指南](https://github.com/soulteary/starbridge/blob/v0.1.0/docs/DEVELOPER_FILES.md#安装更新与回退)。

## 卸载

```bash
brew uninstall <formula>
brew uninstall --cask <cask>
brew untap soulteary/tap
```

## License

各工具遵循其各自仓库中的许可证,本 Tap 仓库以 [Apache-2.0](./LICENSE) 授权。
