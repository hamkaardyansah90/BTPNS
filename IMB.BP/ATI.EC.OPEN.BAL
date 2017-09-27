*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE ATI.EC.OPEN.BAL
*-----------------------------------------------------------------------------
* Developer Name     : Dwi K
* Development Date   : 20161010
* Description        : Routine to set opening balance 0 
*-----------------------------------------------------------------------------
* Modification History:-
*-----------------------------------------------------------------------------
* Date               :
* Modified by        :
* Description        :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON

*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS

    RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------
    FN.ATI.TT.AC.FULL.STATEMENT.TEMP = 'F.ATI.TT.AC.FULL.STATEMENT.TEMP'
    F.ATI.TT.AC.FULL.STATEMENT.TEMP  = ''
    CALL OPF(FN.ATI.TT.AC.FULL.STATEMENT.TEMP,F.ATI.TT.AC.FULL.STATEMENT.TEMP)

    RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------

    Y.AC.ID = O.DATA
    SEL.CMD  = "SELECT ":FN.ATI.TT.AC.FULL.STATEMENT.TEMP:" WITH @ID LIKE ":Y.AC.ID:"..."
    SEL.LIST = ""
    CALL EB.READLIST(SEL.CMD,SEL.LIST,"",NO.REC,ERR)

    IF SEL.LIST THEN
        O.DATA = 0
    END

    RETURN
*-----------------------------------------------------------------------------
END












