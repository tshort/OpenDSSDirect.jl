module Parser

    using ..lib
    using ..utils

    """(read-only) Use this property to parse a Matrix token in OpenDSS format.  Returns square matrix of order specified. Order same as default Fortran order: column by column."""
    function Matrix(ExpectedOrder)
        return get_float64_array(lib.Parser_Get_Matrix, ExpectedOrder)
    end

    """(read-only) Use this property to parse a matrix token specified in lower triangle form. Symmetry is forced."""
    function SymMatrix(ExpectedOrder)
        return get_float64_array(lib.Parser_Get_SymMatrix, ExpectedOrder)
    end

    """(read-only) Returns token as array of doubles. For parsing quoted array syntax."""
    function Vector(ExpectedSize)
        return get_float64_array(lib.Parser_Get_Vector, ExpectedSize)
    end

    function ResetDelimiters()
        lib.Parser_ResetDelimiters()
    end

    """Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
    function AutoIncrement()
        return lib.Parser_Get_AutoIncrement() != 0
    end

    """Default is FALSE. If TRUE parser automatically advances to next token after DblValue, IntValue, or StrValue. Simpler when you don't need to check for parameter names."""
    function AutoIncrement(Value)
        lib.Parser_Set_AutoIncrement(Value)
    end

    """
    (read) Get String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
    (write) Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
    """
    function BeginQuote()
        return get_string(lib.Parser_Get_BeginQuote())
    end

    """
    (read) Get String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
    (write) Set String containing the the characters for Quoting in OpenDSS scripts. Matching pairs defined in EndQuote. Default is "'([{.
    """
    function BeginQuote(Value::String)
        lib.Parser_Set_BeginQuote(Value)
    end

    """String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
    function CmdString()
        return get_string(lib.Parser_Get_CmdString())
    end

    """String to be parsed. Loading this string resets the Parser to the beginning of the line. Then parse off the tokens in sequence."""
    function CmdString(Value::String)
        lib.Parser_Set_CmdString(Value)
    end

    """(read-only) Return next parameter as a double."""
    function DblValue()
        return lib.Parser_Get_DblValue()
    end

    """String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
    function Delimiters()
        return get_string(lib.Parser_Get_Delimiters())
    end

    """String defining hard delimiters used to separate token on the command string. Default is , and =. The = separates token name from token value. These override whitesspace to separate tokens."""
    function Delimiters(Value::String)
        lib.Parser_Set_Delimiters(Value)
    end

    """String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}"""
    function EndQuote()
        return get_string(lib.Parser_Get_EndQuote())
    end

    """String containing characters, in order, that match the beginning quote characters in BeginQuote. Default is "')]}"""
    function EndQuote(Value::String)
        lib.Parser_Set_EndQuote(Value)
    end

    """(read-only) Return next parameter as a long integer."""
    function IntValue()
        return lib.Parser_Get_IntValue()
    end

    """(read-only) Get next token and return tag name (before = sign) if any. See AutoIncrement."""
    function NextParam()
        return get_string(lib.Parser_Get_NextParam())
    end

    """(read-only) Return next parameter as a string"""
    function StrValue()
        return get_string(lib.Parser_Get_StrValue())
    end

    """
    (read) Get the characters used for White space in the command string.  Default is blank and Tab.
    (write) Set the characters used for White space in the command string.  Default is blank and Tab.
    """
    function WhiteSpace()
        return get_string(lib.Parser_Get_WhiteSpace())
    end

    """
    (read) Get the characters used for White space in the command string.  Default is blank and Tab.
    (write) Set the characters used for White space in the command string.  Default is blank and Tab.
    """
    function WhiteSpace(Value::String)
        lib.Parser_Set_WhiteSpace(Value)
    end

end
