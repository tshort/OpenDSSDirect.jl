module Relays

    using ..lib
    using ..utils

    """(read-only) Array of strings containing names of all Relay elements"""
    function AllNames()
        return get_string_array(lib.Relays_Get_AllNames)
    end

    """(read-only) Number of Relays in circuit"""
    function Count()
        return lib.Relays_Get_Count()
    end

    """(read-only) Set First Relay active. If none, returns 0."""
    function First()
        return lib.Relays_Get_First()
    end

    """Full name of object this Relay is monitoring."""
    function MonitoredObj()
        return get_string(lib.Relays_Get_MonitoredObj())
    end

    """Full name of object this Relay is monitoring."""
    function MonitoredObj(Value::String)
        lib.Relays_Set_MonitoredObj(Value)
    end

    """Number of terminal of monitored element that this Relay is monitoring."""
    function MonitoredTerm()
        return lib.Relays_Get_MonitoredTerm()
    end

    """Number of terminal of monitored element that this Relay is monitoring."""
    function MonitoredTerm(Value)
        lib.Relays_Set_MonitoredTerm(Value)
    end

    """
    (read) Get name of active relay.
    (write) Set Relay active by name
    """
    function Name()
        return get_string(lib.Relays_Get_Name())
    end

    """
    (read) Get name of active relay.
    (write) Set Relay active by name
    """
    function Name(Value::String)
        lib.Relays_Set_Name(Value)
    end

    """(read-only) Advance to next Relay object. Returns 0 when no more relays."""
    function Next()
        return lib.Relays_Get_Next()
    end

    """Full name of element that will be switched when relay trips."""
    function SwitchedObj()
        return get_string(lib.Relays_Get_SwitchedObj())
    end

    """Full name of element that will be switched when relay trips."""
    function SwitchedObj(Value::String)
        lib.Relays_Set_SwitchedObj(Value)
    end

    """Terminal number of the switched object that will be opened when the relay trips."""
    function SwitchedTerm()
        return lib.Relays_Get_SwitchedTerm()
    end

    """Terminal number of the switched object that will be opened when the relay trips."""
    function SwitchedTerm(Value)
        lib.Relays_Set_SwitchedTerm(Value)
    end

    """
    (read) Get/Set active Relay by index into the Relay list. 1..Count
    (write) Get/Set Relay active by index into relay list. 1..Count
    """
    function Idx()
        return lib.Relays_Get_idx()
    end

    """
    (read) Get/Set active Relay by index into the Relay list. 1..Count
    (write) Get/Set Relay active by index into relay list. 1..Count
    """
    function Idx(Value)
        lib.Relays_Set_idx(Value)
    end

end
