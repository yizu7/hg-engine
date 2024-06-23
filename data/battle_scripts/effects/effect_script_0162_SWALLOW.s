.include "asm/include/battle_commands.inc"

.data

_000:
    CompareMonDataToValue OPCODE_EQU, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_COUNT, 0, _078
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_COUNT, BSCRIPT_VAR_HP_CALC
    UpdateVar OPCODE_SUB, BSCRIPT_VAR_HP_CALC, 3
    UpdateVar OPCODE_MUL, BSCRIPT_VAR_HP_CALC, -1
    UpdateVar OPCODE_SET, BSCRIPT_VAR_CALC_TEMP, 0x00000001
    UpdateVarFromVar OPCODE_LEFT_SHIFT, BSCRIPT_VAR_CALC_TEMP, BSCRIPT_VAR_HP_CALC
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_MAXHP, BSCRIPT_VAR_HP_CALC
    DivideVarByVar BSCRIPT_VAR_HP_CALC, BSCRIPT_VAR_CALC_TEMP
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_COUNT, 0
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_DEF_BOOSTS, BSCRIPT_VAR_CALC_TEMP
    UpdateMonDataFromVar OPCODE_SUB_TO_ZERO, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STAT_CHANGE_DEF, BSCRIPT_VAR_CALC_TEMP
    UpdateMonDataFromVar OPCODE_GET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_SPDEF_BOOSTS, BSCRIPT_VAR_CALC_TEMP
    UpdateMonDataFromVar OPCODE_SUB_TO_ZERO, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STAT_CHANGE_SPDEF, BSCRIPT_VAR_CALC_TEMP
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_DEF_BOOSTS, 0
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_ATTACKER, BMON_DATA_STOCKPILE_SPDEF_BOOSTS, 0
    UpdateVarFromVar OPCODE_SET, BSCRIPT_VAR_MSG_BATTLER_TEMP, BSCRIPT_VAR_BATTLER_ATTACKER
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_DIRECT, MOVE_SIDE_EFFECT_ON_HIT|MOVE_SUBSCRIPT_PTR_SWALLOW
    End 

_078:
    PrintAttackMessage 
    Wait 
    WaitButtonABTime 30
    // But it failed to swallow a thing!
    PrintMessage 815, TAG_NONE
    Wait 
    WaitButtonABTime 30
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_MOVE_STATUS_FLAGS, MOVE_STATUS_NO_MORE_WORK
    End 
