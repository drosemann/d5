#pragma once
#ifndef TL_REWRITE_H
#define TL_REWRITE_H
int tl_rewrite_file(const char *from, const char *in_path, const char *out_path, int roast,
                    char **warn_out);
#endif
