**ROUTINE TO GET CATEGORY ACCT CREDIT FOR SEND TO SWITCHING
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
    SUBROUTINE IDI.INTF.GET.CATEG.ACCT.CR(Y.RET.VALUE)

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_IDI.WS.INC.POST.PROCESS.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.ACCOUNT
*DEBUG
    FN.FUNDS.TRF = 'F.FUNDS.TRANSFER'
    F.FUNDS.TRF = ''
    CALL OPF(FN.FUNDS.TRF,F.FUNDS.TRF)

    FN.ACC.TRF = 'F.ACCOUNT'
    F.ACC.TRF = ''
    CALL OPF(FN.ACC.TRF,F.ACC.TRF)

    Y.FT.ID = Y.ID.ORC
    CALL F.READ(FN.FUNDS.TRF,Y.FT.ID,R.FUNDS.TRF,F.FUNDS.TRF,ERR)
    Y.ACCT.CR = R.FUNDS.TRF<FT.CREDIT.ACCT.NO>


*Y.ACC = LEFT(Y.ACCT.CR,3)
    IF (LEFT(Y.ACCT.CR,3)) EQ 'IDR' OR (LEFT(Y.ACCT.CR,2)) EQ 'PL' THEN
        Y.RET.VALUE = '00'
    END ELSE
        CALL F.READ(FN.ACC.TRF,Y.ACCT.CR,R.ACC.TRF,F.ACC.TRF,ERR)
        Y.RET.VALUE = R.ACC.TRF<AC.CATEGORY>
    END

    RETURN

END











