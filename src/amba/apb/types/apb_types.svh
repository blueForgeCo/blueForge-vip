
typedef enum bit {
    READ = 1'b0,
    WRITE = 1'b1
} apb_txn_t;

typedef enum {
    INITIATOR,
    TARGET
} apb_agent_t;
