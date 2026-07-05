# Mira – AI Project Management Assistant

> A multi-agent AI-powered Project Management Assistant built using **n8n**, **OpenAI GPT-4o-mini**, **Supabase**, and **Langfuse**.

---

## Overview

Mira is an AI-powered Project Management Assistant designed to improve the productivity of Project Managers (PMs) and Technical Program Managers (TPMs). The solution leverages a modular multi-agent architecture to understand user intent, intelligently route requests to specialized AI agents, retrieve contextual knowledge when required, and generate grounded responses.

The project demonstrates modern AI engineering practices including workflow orchestration, selective Retrieval-Augmented Generation (RAG), audit logging, observability, and structured evaluation.

---

## Key Features

- Intent classification using GPT-4o-mini
- Confidence-based routing
- Multi-agent architecture
- Project Planning Agent
- Risk Assessment Agent
- Status Reporting Agent
- Milestone Tracking Agent
- Selective Classical RAG
- Semantic search using Supabase pgvector
- Audit logging using Supabase
- AI observability using Langfuse
- Modular n8n workflows
- Structured baseline evaluation

---

# Solution Architecture

The solution follows a modular orchestration architecture.

```
User
   │
   ▼
n8n Chat Interface
   │
   ▼
Intent Classification (GPT-4o-mini)
   │
   ▼
Confidence Evaluation
   │
   ▼
Agent Router
   ├────────────► Planner Agent
   ├────────────► Risk Assessment Agent (Classical RAG)
   ├────────────► Status Reporter Agent
   └────────────► Milestone Tracker Agent
          │
          ▼
   User Response
```

The complete architecture diagram is available in:

```
Documents/
    Architecture_Diagram.png
```

---

# Multi-Agent Architecture

The system consists of four specialist AI agents.

| Agent | Responsibility |
|---------|----------------|
| Planner Agent | Generates project plans, timelines, deliverables and execution roadmap |
| Risk Assessment Agent | Identifies project risks using Classical RAG and generates grounded recommendations |
| Status Reporter Agent | Retrieves project and sprint status from structured project data |
| Milestone Tracker Agent | Tracks completed and upcoming project milestones |

Only one specialist agent is executed for each request, reducing latency and token usage.

---

# Retrieval-Augmented Generation (RAG)

The Risk Assessment Agent implements **Classical Retrieval-Augmented Generation (RAG)**.

Workflow:

```
User Question
        │
        ▼
OpenAI Embeddings
        │
        ▼
Supabase pgvector
        │
Semantic Retrieval
        │
        ▼
Retrieved Context
        │
        ▼
GPT-4o-mini
        │
        ▼
Grounded Response
```

### Why only one RAG agent?

Only the Risk Assessment Agent requires semantic understanding of project knowledge.

The remaining agents operate primarily on structured project data such as:

- Tasks
- Milestones
- Sprint information
- Project plans

Using RAG only where necessary reduces latency, token consumption and operational cost.

---

# Technology Stack

| Component | Technology |
|------------|------------|
| Workflow Orchestration | n8n Cloud |
| Large Language Model | OpenAI GPT-4o-mini |
| Embedding Model | OpenAI Embeddings |
| Vector Database | Supabase pgvector |
| Audit Database | Supabase PostgreSQL |
| Observability | Langfuse |
| Programming Language | JavaScript |

---

# Repository Structure

```
Mira-AI-PM-Assistant
│
├── Database
│   ├── schema.sql
│   ├── audit_table.sql
│   ├── vector_table.sql
│   └── supabase_schema.docx
│
├── Documents
│   ├── Architecture_Diagram.png
│   ├── Cost_Analysis_and_Evaluation_Strategy.docx
│   ├── Ideation_AI_Agent_Use_Cases.docx
│   ├── Program_Charter.docx
│   ├── Reflection_and_Next_Steps.docx
│   └── Test_Case_Results.xlsx
│
├── Prompts
│   ├── Intent Classifier Prompt
│   ├── Planner Agent Prompt
│   ├── Risk Assessment Agent Prompt
│   ├── Status Reporter Prompt
│   └── Milestone Tracker Prompt
│
├── Screenshots
│   ├── Workflow Canvas
│   ├── Mira in Action
│   ├── Langfuse Trace
│   ├── Supabase Tables
│   └── Individual Agent Workflows
│
├── Workflows
│   ├── Mira - Orchestrator Agent.json
│   ├── Mira - Planner Agent.json
│   ├── Mira - Risk Assessor Agent.json
│   ├── Mira - Status Reporter Agent.json
│   └── Mira - Milestone Tracker Agent.json
│
└── README.md
```

---

# Observability

Langfuse was integrated to provide end-to-end observability of AI executions.

Each execution records:

- User Question
- Intent
- Confidence Score
- Selected Agent
- Model Used
- Input
- Output
- Latency
- Trace Metadata

Langfuse enables debugging, prompt analysis, response evaluation, and future optimization without modifying application logic.

---

# Audit Logging

Supabase serves two distinct purposes within the solution.

## Vector Store

The **mira_documents_v2** table stores vector embeddings used by the Risk Assessment Agent for semantic retrieval.

## Audit Logging

The **agent_logs** table stores:

- Question
- Intent
- Confidence
- Selected Agent
- Response
- Timestamp

This provides complete traceability of every interaction independent of Langfuse.

---

# Evaluation

The solution was evaluated using the supplied baseline dataset consisting of **12 representative test cases**.

Evaluation covered:

- Intent Classification
- Agent Routing
- Response Quality
- Grounding Accuracy
- Hallucination Resistance
- End-to-End Workflow Validation
- Observability Validation

### Summary

- Correct routing across specialist agents
- Grounded responses for the Risk Assessment Agent using Classical RAG
- Successful Langfuse trace generation
- Successful audit logging in Supabase
- Consistent performance across baseline scenarios

A complete evaluation report is included in:

```
Documents/
    Cost_Analysis_and_Evaluation_Strategy.docx
```

---

# Screenshots

The repository includes screenshots demonstrating the complete implementation.

- Workflow Canvas
- Mira Chat Interface
- Individual Agent Workflows
- Langfuse Trace
- Supabase Tables
- Architecture Diagram

---

# Setup Instructions

1. Import all workflow JSON files into n8n.
2. Configure OpenAI API credentials.
3. Configure Supabase credentials.
4. Configure Langfuse API credentials.
5. Execute the Orchestrator workflow from the n8n Chat Interface.

---

# Future Enhancements

Potential future improvements include:

- Dynamic tool selection for structured database queries
- Hybrid search combining semantic and keyword retrieval
- Automated evaluation datasets in Langfuse
- LLM-as-a-Judge quality scoring
- Human-in-the-loop approval workflows
- Multi-turn conversational memory
- Additional PM/TPM specialist agents

---

# Assignment Deliverables

This repository contains all required submission artifacts.

- Multi-agent n8n workflows
- Prompt files
- Database schema
- Architecture diagram
- Program Charter
- AI Agent Ideation
- Reflection and Next Steps
- Cost Analysis and Evaluation Strategy
- Baseline Test Results
- Langfuse observability evidence
- Screenshots of the implemented solution

---

## Author

**Mayur Kanadkhedkar**

AI Project Management Assistant (Mira)

Built as part of the Nexora AI Agent assignment to demonstrate practical application of multi-agent orchestration, Retrieval-Augmented Generation (RAG), AI observability, and workflow automation.
