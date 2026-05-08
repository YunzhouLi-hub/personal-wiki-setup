# Personal Wiki Setup — Cowork Skill

一键搭建个人 LLM+Wiki 知识管理系统 | One-click Personal LLM+Wiki Knowledge Base Setup

[![Cowork Skill](https://img.shields.io/badge/Cowork-Skill-purple)](https://claude.ai)
[![Based on](https://img.shields.io/badge/Based%20on-Obsidian+Claude%20Code-blue)](#)

## Overview | 概述

This Cowork skill automates the setup of a **Personal Wiki + LLM-powered Knowledge Management System**, inspired by the Obsidian + Claude Code workflow. When invoked, it:

> 该 Cowork Skill 自动化搭建**个人 LLM+Wiki 知识管理系统**，灵感来源于 Obsidian + Claude Code 工作流。调用时自动完成：

- **Creates** a complete Obsidian Vault directory structure (Inbox, Daily, Knowledge, Projects, Templates, Assets)
- **Generates** a comprehensive `CLAUDE.md` constitution that defines the AI knowledge manager's roles and rules
- **Sets up** reusable note templates (daily, reading, atomic, MOC)
- **Configures** Cowork scheduled tasks for automated knowledge management inbox processing, graph analysis, MOC maintenance
- **Supports** hybrid mode — works both in Cowork and with native Obsidian + Claude Code

### System Architecture | 系统架构

```
收集 (Inbox) → AI 编译 (Process) → 结构化存储 (Atomic Notes)
→ MOC 聚合 (Thematic Map) → 智能分析 (Analyze) → 价值输出 (Generate)
→ 体系迭代 (Review)
```

## Installation | 安装方式

### 方式一：通过 Cowork 安装（推荐）

1. 确保你已安装 [Cowork Desktop](https://claude.ai)
2. 在任意对话中直接输入命令调用该 skill：
   ```
   /personal-wiki-setup
   ```
   Claude 会自动引导你完成整个初始化过程。

### 方式二：手动安装

1. 打开 Cowork 设置 → Skills 管理
2. 点击「Add Skill」，将 `SKILL.md` 的内容粘贴进去
3. 保存后即可在对话中通过 `/personal-wiki-setup` 调用

### 方式三：克隆本仓库在 Claude Code 中使用

```bash
git clone https://github.com/your-username/personal-wiki-setup.git
cd personal-wiki-setup
# 在 Claude Code 中打开，SKILL.md 会自动生效
```

## What It Does | 功能详情

### Phase 1: Vault Initialization | 初始化 Vault

Creates the following directory structure:

```
PersonalWiki/
├── 00_Inbox/          # 收集箱 — 零散信息暂存
├── 01_Daily/          # 每日笔记 — 日记、日复盘
├── 02_Reading/        # 阅读笔记 — 精华摘录
├── 03_Knowledge/      # 主题知识 — 原子化笔记
│   ├── AI/
│   └── Programming/
├── 04_Projects/       # 项目资料 — 项目文档
├── 05_Templates/      # 模板库 — 笔记模板
├── 06_Assets/         # 资源库 — 媒体文件
└── CLAUDE.md          # 核心宪法 — AI 知识管理员规则
```

### Phase 2: CLAUDE.md Constitution | 生成核心宪法

The generated `CLAUDE.md` defines 5 core responsibilities:

| 职责 | 说明 |
|------|------|
| **Inbox 处理** | 将零散信息编译为原子化笔记，自动分类、打标签、建链接 |
| **MOC 维护** | 当主题笔记达到 5 篇时自动创建/更新主题地图 |
| **格式规范** | 统一笔记格式、标签规范、链接格式 |
| **知识网络分析** | 每周生成健康报告：孤立笔记、枢纽节点、标签统计 |
| **知识输出** | 协助文章起草、报告生成、思维导图等 |

### Phase 3: Cowork Automation | Cowork 自动化

| 任务 | 定时 | 说明 |
|------|------|------|
| Inbox 处理器 | 工作日 9:00 | 自动编译 Inbox 中的零散信息 |
| 知识网络分析 | 每周一 10:00 | 输出知识库健康报告 |
| MOC 自动维护 | 每天 8:00 | 自动创建和更新主题地图 |

### Phase 4: External Setup Guide | 外部设置引导

After initialization, guides the user to:
- Open the Vault in **Obsidian**
- Install recommended plugins (Dataview, Templater, Excalidraw, etc.)
- Optionally install **Claude Code** for native workflows

## Requirements | 前置要求

- [Cowork Desktop](https://claude.ai) (for native skill usage)
- Or [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) + [Obsidian](https://obsidian.md) (for manual setup)

## Why This Works | 设计理念

> **Obsidian** = 大脑皮层（记忆和关联）
> **Claude Code / Cowork** = 前额叶（调度和处理）
> 二者合一，才是一个完整的思考系统。

| 层面 | 人 | AI |
|------|----|-----|
| 不可替代 | 高质量输入、架构定义、最终审核、创造性输出 | — |
| 高效执行 | — | 格式化、标准化、链接建立、数据分析、初稿合成 |

## Related Resources | 参考资料

- [超详细版：Obsidian + Claude Code 搭建个人知识库实践指南](https://www.cnblogs.com/AlayaNeW/articles/19902167) — 本文 Skill 的原始方法论来源
- [Obsidian](https://obsidian.md) — 本地优先的知识管理工具
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) — AI 编程与自动化引擎

## License

MIT
