---
name: personal-wiki-setup
description: 一键搭建个人 LLM+Wiki 知识管理系统：初始化 Obsidian Vault（目录结构 + CLAUDE.md + 模板）+ Cowork 自动化工作流（Inbox 处理、知识图谱分析）
---

# Personal Wiki Setup — 一键搭建个人 LLM+Wiki 知识库

## 概述

本 Skill 将一个 Obsidian + Claude Code 风格的个人知识库（Personal Wiki）完整初始化到用户指定的目录中，同时为 Cowork 环境配置自动化的知识管理工作流。

### 系统架构

```
用户输入（Inbox） → AI 编译（Process） → 结构化存储（Atomic Notes）
→ MOC 聚合（Thematic Map） → 智能分析（Analyze） → 价值输出（Generate）
→ 体系迭代（Review）
```

### 人机分工

| 角色 | 职责 |
|------|------|
| **用户（不可替代）** | 输入高质量信息源；定义知识边界和分类；审核 AI 产出；创造性输出 |
| **AI / Cowork** | 格式化执行者；建立链接和发现关联；数据统计分析；初稿合成 |

---

## 第一阶段：确认初始化参数

在与用户对话中，首先确认以下信息：

1. **Vault 根目录路径** — 要在哪里创建这个知识库？（让用户选择一个文件夹，或提示输入路径）
2. **知识库名称** — 默认使用「PersonalWiki」，用户可自定义
3. **是否需要 Cowork 自动化** — 即是否设置定时/手动任务来维护知识库

---

## 第二阶段：创建 Vault 目录结构

在用户指定的根目录下创建以下完整目录结构：

```
{root}/PersonalWiki/
├── 00_Inbox/             # 【收集箱】所有未经处理的临时信息
├── 01_Daily/             # 【每日笔记】日记、日复盘、临时待办
├── 02_Reading/           # 【阅读笔记】文章精华摘录与笔记
├── 03_Knowledge/         # 【主题知识】按领域分类的结构化知识
│   ├── AI/
│   └── Programming/
├── 04_Projects/          # 【项目资料】进行中/已完成的项目文档
├── 05_Templates/         # 【模板库】各种笔记模板
├── 06_Assets/            # 【资源库】图片、附件等媒体文件
└── CLAUDE.md             # 【核心宪法】AI 知识管理员的角色定义与规则
```

**创建方式**：使用 Bash 命令直接创建目录和文件。

### 目录用途说明

| 目录 | 用途 | 读写权限 |
|------|------|----------|
| `00_Inbox` | 收集箱 — 任何想法、摘录、待办先丢进来 | 可读写 |
| `01_Daily` | 每日笔记 — 日记、日复盘 | 只读* |
| `02_Reading` | 阅读笔记 — 外部文章的精华摘录 | 只读* |
| `03_Knowledge` | 主题知识 — 原子化笔记按领域归档 | 可读写 |
| `04_Projects` | 项目资料 — 项目文档 | 只读* |
| `05_Templates` | 模板库 — 各种笔记模板 | 只读* |
| `06_Assets` | 资源库 — 图片、附件 | 只读* |

> *除非用户明确指令，否则 AI 不得修改只读目录中的文件。

---

## 第三阶段：创建 CLAUDE.md（核心宪法）

在 Vault 根目录创建 `CLAUDE.md` 文件。这是整个系统的核心，定义了 AI 知识管理员的所有职责、规范和边界。

### 模板内容

```markdown
# Personal Wiki — 核心宪法

> 本文件定义了 AI 知识管理员的角色、原则和工作规范。
> 将随着知识体系的发展定期更新。

---

## 核心原则

### 1. 文件夹管理领域
- 一级文件夹代表**大领域**，如阅读、项目、知识
- 不重复交叉，避免分类模糊

### 2. 标签管属性
- 标签用于描述**属性**，而非领域
- 格式：`#一级标签/二级标签`（如 `#AI/LLM`、`#programming/python`）
- 常用属性标签：`#status/pending`、`#priority/high`、`#type/tutorial`

### 3. 命名规范
- 文件名使用 `短横线命名法`：`高效微调.md`
- 日期格式：`YYYY-MM-DD`
- 会议记录：`YYYY-MM-DD-会议主题.md`
- MOC 命名：`MOC-主题名.md`，如 `MOC-AI-基础.md`

### 4. 标签使用规范

#### 状态标签
- `#status/pending` — 需要进一步处理
- `#status/in-progress` — 正在撰写或完善
- `#status/complete` — 内容完整可发布

#### 类型标签
- `#type/tutorial` — 学习教程类
- `#type/note` — 记录整理类
- `#type/idea` — 个人思考类
- `#type/material` — 写作素材类
- `#type/MOC` — 主题地图

---

## 五大核心职责

### 职责一：每日消化 Inbox

**任务**：定时处理 `00_Inbox` 文件夹中的所有新笔记。

**动作**：
1. 阅读内容，提炼核心观点
2. 将其重写为原子化笔记（一篇笔记只阐述一个核心概念）
3. 根据内容移动到 `03_Knowledge` 下的正确子文件夹
4. 为笔记添加 2-3 个精准的标签
5. 基于现有知识网络，添加至少 3 个双向链接（`[[相关笔记]]`）

---

### 职责二：维护知识体系（MOC）

**任务**：维护 `03_Knowledge` 目录下的主题地图（MOC）。

**触发条件**：当某主题文件夹内笔记数量达到 5 篇时，自动创建或更新 MOC。

**MOC 格式**：
- 文件命名：`MOC-主题名.md`
- 内容应包括：
  - 核心概念列表（带简要说明）
  - 应用场景
  - 相关主题链接

---

### 职责三：强制执行格式规范

**任务**：确保所有经处理的笔记格式统一。

- 严格使用 `05_Templates` 中对应的模板
- 内部链接使用双括号格式 `[[准确的笔记标题]]`
- 标签使用 `#一级标签/二级标签` 的层级格式

---

### 职责四：每周知识网络分析

**输出报告**需包含：
1. **孤立笔记清单** — 没有入链或出链的笔记
2. **核心枢纽节点** — 被链接次数最多的笔记
3. **标签使用统计** — 过度使用或很少使用的标签
4. **知识缺口分析** — 建议补充的关联领域

---

### 职责五：支持知识输出

**能力**：
- 协助起草文章大纲
- 生成报告初稿
- 制作思维导图结构
- 整合多篇笔记回答复杂问题

---

## 操作规则与边界

### 内容原则
- **忠于原文**：提炼和转述不能歪曲原意
- **注明来源**：来自外部的信息添加来源链接或说明

### AI 助手指令对照表

| 用户请求 | AI 动作 |
|----------|---------|
| "写笔记" | 使用 `05_Templates` 中的合适模板 |
| "记录灵感" | 放入 `00_Inbox`，标记 `#status/pending` |
| "创建项目" | 在 `04_Projects` 建立文件夹和 MOC |
| "阅读笔记" | 放入 `02_Reading`，提取精华到知识库 |
| "整理 Inbox" | 执行职责一 |
| "创建 MOC" | 当主题笔记 >= 5 篇时执行 |
| "知识输出" | 执行职责五 |

---

*本宪法由 AI 知识管理员遵循，每逢重大调整需与用户确认。*
```

---

## 第四阶段：创建模板文件

在 `05_Templates/` 下创建以下模板：

### 1. 日记模板 `daily-note.md`

```markdown
---
date: {{date:YYYY-MM-DD}}
type: daily
tags: #type/note #status/complete
---

# {{date:YYYY-MM-DD}} 日记

## 今日重点
- 

## 工作/学习记录
- 

## 想法与灵感
- 

## 待办事项
- [ ] 

## 链接
- [[相关笔记]]
```

### 2. 阅读笔记模板 `reading-note.md`

```markdown
---
title: 
source: 
date: {{date:YYYY-MM-DD}}
type: reading
tags: #type/note #status/pending
---

# {{title}}

## 核心观点
- 

## 精华摘录
- 

## 个人思考
- 

## 行动项
- [ ] 

## 链接
- [[相关笔记]]
```

### 3. 原子笔记模板 `atomic-note.md`

```markdown
---
title: 
date: {{date:YYYY-MM-DD}}
type: knowledge
tags: #type/note #status/pending
---

# {{title}}

## 定义/概念
- 

## 核心要点
- 

## 应用场景
- 

## 关联知识
- [[相关笔记1]]
- [[相关笔记2]]

## 来源
-
```

### 4. MOC 模板 `moc-template.md`

```markdown
---
title: MOC - {{topic}}
date: {{date:YYYY-MM-DD}}
type: MOC
tags: #type/MOC
---

# MOC - {{topic}}

## 核心概念
- 

## 应用场景
- 

## 相关主题
- 

## 笔记列表
- [[笔记1]]
- [[笔记2]]
```

---

## 第五阶段：设置 Cowork 自动化工作流

使用 `schedule` 技能（通过 Skill 工具调用），为用户创建以下可选的定时任务：

### 任务 A：Inbox 处理器（推荐：每日运行）

```yaml
taskId: "wiki-process-inbox"
description: "处理 Personal Wiki 的 Inbox，将零散信息编译为原子化知识"
cronExpression: "0 9 * * 1-5"  # 工作日每天上午 9 点
prompt: >
  读取 {root}/PersonalWiki/00_Inbox/ 目录下的所有 Markdown 文件。
  对每个文件执行以下操作：
  1. 提炼核心观点
  2. 重写为原子化笔记（一篇笔记只阐述一个核心概念）
  3. 根据内容移动到 03_Knowledge/ 下的正确子文件夹
  4. 添加 2-3 个精准的标签（如 #AI/LLM）
  5. 查找并添加至少 3 个双向链接 [[相关笔记]]
  6. 处理完毕后删除或归档 Inbox 中的原始文件
```

### 任务 B：知识网络分析（推荐：每周运行）

```yaml
taskId: "wiki-analyze-graph"
description: "分析 Personal Wiki 知识网络健康状况"
cronExpression: "0 10 * * 1"  # 每周一上午 10 点
prompt: >
  分析 {root}/PersonalWiki/ 知识库，生成一份健康报告，包含：
  1. 孤立笔记清单（无入链/出链的笔记）
  2. 核心枢纽节点（被链接最多的笔记）
  3. 标签使用统计
  4. 知识缺口分析
  将报告保存到 04_Projects/wiki-health-report.md
```

### 任务 C：MOC 自动维护（可选：每日运行）

```yaml
taskId: "wiki-update-mocs"
description: "自动维护 Personal Wiki 的主题地图（MOC）"
cronExpression: "0 8 * * *"  # 每天上午 8 点
prompt: >
  检查 {root}/PersonalWiki/03_Knowledge/ 下每个子文件夹。
  如果某文件夹内笔记数量 >= 5 篇且尚无 MOC 文件，自动创建 MOC。
  如果 MOC 已存在但笔记列表过期，则更新。
```

### 手动命令（不设置定时，按需使用）

除了定时任务外，以下命令可以在对话中随时触发：
- "处理 Inbox" → 执行任务 A 的逻辑一次
- "分析知识网络" → 执行任务 B 的逻辑一次
- "更新 MOC" → 执行任务 C 的逻辑一次
- "生成文章草稿 [主题]" → 遍历知识库，整合相关笔记输出文章大纲
- "搜索 [关键词]" → 扫描全部 Markdown 文件，返回匹配结果及链接

---

## 第六阶段：引导用户完成外部设置

如果用户希望在 Obsidian 中本地使用这个知识库，提供以下引导：

### 1. 安装 Obsidian
- 访问 https://obsidian.md 下载安装
- 打开 Obsidian → "打开本地文件夹" → 选择 `{root}/PersonalWiki/`

### 2. 推荐 Obsidian 插件
| 插件 | 用途 |
|------|------|
| Dataview | 类 SQL 查询，动态生成笔记列表 |
| Templater | 高级模板（与模板文件配合使用） |
| Excalidraw | 手绘风格白板图表 |
| Omnisearch | 增强全文搜索 |
| Tag Wrangler | 批量管理标签 |

### 3. 安装 Claude Code（可选，用于 Claude Code 原生工作流）
```bash
npm install -g @anthropic-ai/claude-code
cd {root}/PersonalWiki
claude
```

---

## 执行清单

Skill 被调用后，按以下顺序执行：

- [ ] 确认用户指定的 Vault 根目录路径
- [ ] 创建完整目录结构（`mkdir -p`）
- [ ] 生成并写入 `CLAUDE.md`
- [ ] 创建 4 个模板文件到 `05_Templates/`
- [ ] 询问用户是否设置 Cowork 定时任务
  - [ ] 如果需要 → 调用 `schedule` 技能创建任务 A/B/C
- [ ] 告知用户已完成初始化，提供 Obsidian 打开指引
- [ ] 保存一份初始化摘要到 `04_Projects/wiki-setup-summary.md`
