#pragma once
#ifndef TL_LEXER_H
#define TL_LEXER_H

typedef enum {
    T_EOF, T_IDENT, T_NUMBER, T_STRING,
    T_SHOWTIME, T_TERMINATED, T_FUNC_BEGIN, T_FUNC_END,
    T_VAR_STATIC, T_VAR_ENTERPRISE, T_ALLOC_LEAK, T_ASSIGN, T_COPY,
    T_SCALE_UP, T_SCALE_DOWN, T_TEMP_VAR, T_NO_REDUNDANCY, T_VAGUE_GOALS,
    T_FOCUS_NULL, T_OWNERS, T_ROTATE,
    T_IF, T_ELSE, T_WHILE, T_CONTINUE, T_BREAK,
    T_DNS, T_ON_MY_MACHINE, T_DISABLE_OPA, T_TERRAFORM_CHAOS,
    T_PROB5, T_SBOM_OBFUSCATE, T_REBOOT_RESET,
    T_PRINT, T_SLACK, T_JIRA, T_CONFLUENCE, T_KNOWLEDGE_SINK,
    T_DATADOG, T_CLOUD, T_GRAFANA, T_ESCALATE, T_LEGACY_TEAM,
    T_CAB_SEND, T_JUSTIFICATION, T_VACATION, T_SYNC, T_DOUBLE_BOOKED,
    T_METRICS_UP, T_METRICS_LOOP, T_CAB_TUESDAY, T_TEMP_SCRIPT,
    T_GOVERNANCE, T_AD_STORE, T_PHONE_SECURE, T_AMIGA, T_TOS_HIDE,
    T_RESEARCH, T_PROD_FRIDAY, T_SBOM_ADD, T_PHISH33, T_PHISH85,
    T_METRICS_FOREVER, T_BLOCKED_TEAM, T_NEWLINE, T_UNKNOWN,
    T_RETURN, T_FOR
} TlTokKind;

typedef struct {
    TlTokKind kind;
    char *text;   /* ident / string content / number text */
    int line;
} TlToken;

typedef struct {
    TlToken *items;
    int count, cap;
    char *error;
    int error_line;
} TlTokVec;

void tl_tokens_init(TlTokVec *v);
void tl_tokens_free(TlTokVec *v);
int tl_lex(const char *src, const char *filename, TlTokVec *out);
const char *tl_tokname(TlTokKind k);

#endif
