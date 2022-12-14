 =-- extracted from rfc2115.txt
-- at Mon Nov 15 17:11:45 1999
   ?"The range of DLCI values.  Note that this varies by
            interface configuration; normally, interfaces may use
            0..1023, but may be configured to use ranges as large
            as 0..2^23."                                                                             U"The MIB module to describe the use of a Frame Relay
            interface by a DTE."?"       Caralyn Brown
            Postal: Cadia Networks, Inc.
                    1 Corporate Drive
                    Andover, Massachusetts  01810
            Tel:    +1 508 689 2400 x133
            E-Mail: cbrown@cadia.com

                    Fred Baker
            Postal: Cisco Systems
                    519 Lado Drive
                    Santa Barbara, California 93111
            Tel:    +1 408 526 425
            E-Mail: fred@cisco.com" "9705010229Z" "9204010000Z" ?"Converted from SMIv1 to SMIv2. (Thus, indices are
            read-only rather than being not-accessible.) Added
            objects and made clarifications based on implementation
            experience." L"Published as RFC 1315, the initial version of this MIB
            module."        -- Thu May  1 02:29:46 PDT 1997
       ?"The Parameters for the Data Link Connection Management
            Interface for the frame relay service on this
            interface." 1"American National Standard T1.617-1991, Annex D"                     X"The Parameters for a particular Data Link Connection
            Management Interface."                       1"The ifIndex value of the corresponding ifEntry."                       ?"This variable states which Data Link Connection
            Management scheme is active (and by implication, what
            DLCI it uses) on the Frame Relay interface." ?"American National Standard T1.617-1991, American
            National Standard T1.617a-1994, ITU-T Recommendation
            Q.933 (03/93)."                     _"This variable states which address format is in use on
            the Frame Relay interface."                       ?"This variable states the address length in octets.  In
            the case of Q922 format, the length indicates the
            entire length of the address including the control
            portion."                       W"This is the number of seconds between successive
            status enquiry messages." M"American National Standard T1.617-1991, Section D.7
            Timer T391."                     l"Number of status enquiry intervals that pass before
            issuance of a full status enquiry message." O"American National Standard T1.617-1991, Section D.7
            Counter N391."                     ?"This is the maximum number of unanswered Status
            Enquiries the equipment shall accept before declaring
            the interface down." Q"American National Standard T1.617-1991, Section D.5.1
            Counter N392."                    "This is the number of status polling intervals over
            which the error threshold is counted.  For example, if
            within 'MonitoredEvents' number of events the station
            receives 'ErrorThreshold' number of errors, the
            interface is marked as down." Q"American National Standard T1.617-1991, Section D.5.2
            Counter N393."                    >"The maximum number of Virtual Circuits allowed for
            this interface.  Usually dictated by the Frame Relay
            network.

            In response to a SET, if a value less than zero or
            higher than the agent's maximal capability is
            configured, the agent should respond badValue"                       \"This indicates whether the Frame Relay interface is
            using a multicast service."                       ?"This indicates the status of the Frame Relay interface
            as determined by the performance of the dlcmi.  If no
            dlcmi is running, the Frame Relay interface will stay
            in the running state indefinitely."                       w"SNMP Version 2 Row Status Variable.  Writable objects
            in the table may be written in any RowStatus state."                       l"A table containing information about specific Data
            Link Connections (DLC) or virtual circuits."                       ?"The information regarding a single Data Link
            Connection.  Discontinuities in the counters contained
            in this table are indicated by the value in
            frCircuitCreationTime."                       T"The ifIndex Value of the ifEntry this virtual circuit
            is layered onto."                       K"The Data Link Connection Identifier for this virtual
            circuit." 7"American National Standard T1.618-1991, Section 3.3.6"                    "Indicates whether the particular virtual circuit is
            operational.  In the absence of a Data Link Connection
            Management Interface, virtual circuit entries (rows)
            may be created by setting virtual circuit state to
            'active', or deleted by changing Circuit state to
            'invalid'.

            Whether or not the row actually disappears is left to
            the implementation, so this object may actually read as
            'invalid' for some arbitrary length of time.  It is
            also legal to set the state of a virtual circuit to
            'inactive' to temporarily disable a given circuit.

            The use of 'invalid' is deprecated in this SNMP Version
            2 MIB, in favor of frCircuitRowStatus."                      G"Number of frames received from the network indicating
            forward congestion since the virtual circuit was
            created.  This occurs when the remote DTE sets the FECN
            flag, or when a switch in the network enqueues the
            frame to a trunk whose transmission queue is
            congested." 7"American National Standard T1.618-1991, Section 3.3.3"                    J"Number of frames received from the network indicating
            backward congestion since the virtual circuit was
            created.  This occurs when the remote DTE sets the BECN
            flag, or when a switch in the network receives the
            frame from a trunk whose transmission queue is
            congested." 7"American National Standard T1.618-1991, Section 3.3.4"                     W"The number of frames sent from this virtual circuit
            since it was created."                       ?"The number of octets sent from this virtual circuit
            since it was created.  Octets counted are the full
            frame relay header and the payload, but do not include
            the flag characters or CRC."                       W"Number of frames received over this virtual circuit
            since it was created."                       ?"Number of octets received over this virtual circuit
            since it was created.  Octets counted include the full
            frame relay header, but do not include the flag
            characters or the CRC."                       ?"The value of sysUpTime when the virtual circuit was
            created, whether by the Data Link Connection Management
            Interface or by a SetRequest."                       ^"The value of sysUpTime when last there was a change in
            the virtual circuit state"                       ?"This variable indicates the maximum amount of data, in
            bits, that the network agrees to transfer under normal
            conditions, during the measurement interval." D"American National Standard T1.617-1991, Section
            6.5.19"                   '-- the default indicates no commitment
C"This variable indicates the maximum amount of
            uncommitted data bits that the network will attempt to
            deliver over the measurement interval.

            By default, if not configured when creating the entry,
            the Excess Information Burst Size is set to the value
            of ifSpeed." D"American National Standard T1.617-1991, Section
            6.5.19"                    U"Throughput is the average number of 'Frame Relay
            Information Field' bits transferred per second across a
            user network interface in one direction, measured over
            the measurement interval.

            If the configured committed burst rate and throughput
            are both non-zero, the measurement interval, T, is
                T=frCircuitCommittedBurst/frCircuitThroughput.

            If the configured committed burst rate and throughput
            are both zero, the measurement interval, T, is
                       T=frCircuitExcessBurst/ifSpeed." D"American National Standard T1.617-1991, Section
            6.5.19"                   :-- the default value of Throughput is
-- "no commitment".
 ?"This indicates whether this VC is used as a unicast VC
            (i.e. not multicast) or the type of multicast service
            subscribed to" ?"Frame Relay PVC Multicast Service and Protocol
            Description Implementation: FRF.7 Frame Relay Forum
            Technical Committe October 21, 1994"                   Q-- the default value of frCircuitMulticast is
-- "unicast" (not a multicast VC).
 ?"Indication of whether the VC was manually created
            (static), or dynamically created (dynamic) via the data
            link control management interface."                       k"The number of inbound frames dropped because of format
            errors, or because the VC is inactive."                      J"Number of frames received from the network indicating
            that they were eligible for discard since the virtual
            circuit was created.  This occurs when the remote DTE
            sets the DE flag, or when in remote DTE's switch
            detects that the frame was received as Excess Burst
            data." 7"American National Standard T1.618-1991, Section 3.3.4"                    ?"Number of frames sent to the network indicating that
            they were eligible for discard since the virtual
            circuit was created.   This occurs when the local DTE
            sets the DE flag, indicating that during Network
            congestion situations those frames should be discarded
            in preference of other frames sent without the DE bit
            set." E"American National  Standard  T1.618-1991, Section
            3.3.4"                    s"Normally the same value as frDlcmiIfIndex, but
            different when an implementation associates a virtual
            ifEntry with a DLC or set of DLCs in order to associate
            higher layer objects such as the ipAddrEntry with a
            subset of the virtual circuits on a Frame Relay
            interface. The type of such ifEntries is defined by the
            higher layer object; for example, if PPP/Frame Relay is
            implemented, the ifType of this ifEntry would be PPP.
            If it is not so defined, as would be the case with an
            ipAddrEntry, it should be of type Other."                      "This object is used to create a new row or modify or
            destroy an existing row in the manner described in the
            definition of the RowStatus textual convention.
            Writable objects in the table may be written in any
            RowStatus state."                       ?"A table containing information about Errors on the
            Frame Relay interface.  Discontinuities in the counters
            contained in this table are the same as apply to the
            ifEntry associated with the Interface."                       G"The error information for a single frame relay
            interface."                       1"The ifIndex Value of the corresponding ifEntry."                      p"The type of error that was last seen  on  this interface:

     receiveShort: frame was not long enough to allow
             demultiplexing - the address field was incomplete,
             or for virtual circuits using Multiprotocol over
             Frame Relay, the protocol identifier was missing
             or incomplete.

     receiveLong: frame exceeded maximum length configured for this
                  interface.

     illegalAddress: address field did not match configured format.

     unknownAddress: frame received on a virtual circuit which was not
                     active or administratively disabled.

     dlcmiProtoErr: unspecified error occurred when attempting to
                    interpret link maintenance frame.

     dlcmiUnknownIE: link maintenance frame contained an Information
                     Element type which is not valid for the
                     configured link maintenance protocol.

     dlcmiSequenceErr: link maintenance frame contained a sequence
                       number other than the expected value.

     dlcmiUnknownRpt: link maintenance frame contained a Report Type
                      Information Element whose value was not valid
                      for the configured link maintenance protocol.

     noErrorSinceReset: no errors have been detected since the last
                        cold start or warm start."                       ?"An octet string containing as much of the error packet
            as possible.  As a minimum, it must contain the Q.922
            Address or as much as was delivered.  It is desirable
            to include all header and demultiplexing information."                       E"The value of sysUpTime at which the error was
            detected."                       W"The number of times the interface has gone down since
            it was initialized."                      I"The value of sysUpTime at the time when the interface
            was taken down due to excessive errors.  Excessive
            errors is defined as the time when a DLCMI exceeds the
            frDlcmiErrorThreshold number of errors within
            frDlcmiMonitoredEvents. See FrDlcmiEntry for further
            details."                           ^"This variable indicates whether the system produces
            the frDLCIStatusChange trap."                       ?"This variable indicates the number of milliseconds
            that must elapse between trap emissions.  If events
            occur more rapidly, the impementation may simply fail
            to trap, or may queue traps until an appropriate time."                     *-- no minimum elapsed period is specified
    `"This trap indicates that the indicated Virtual Circuit
            has changed state.  It has either been created or
            invalidated, or has toggled between the active and
            inactive states.  If, however, the reason for the state
            change is due to the DLCMI going down, per-DLCI traps
            should not be generated."                         ?"The objects necessary to control the Link Management
            Interface for a Frame Relay Interface as well as
            maintain the error statistics on this interface."                 i"The objects necessary to control the Virtual Circuits
            layered onto a Frame Relay Interface."                 _"The objects necessary to control a Frame Relay
            Interface's notification messages."                 M"Objects designed to assist in debugging Frame Relay
            Interfaces."                 Z"Traps which may be used to enhance event driven
            management of the interface."                     ?"The objects necessary to control the Link Management
            Interface for a Frame Relay Interface as well as
            maintain the error statistics on this interface from
            RFC 1315."                 w"The objects necessary to control the Virtual Circuits
            layered onto a Frame Relay Interface from RFC 1315."                 ["Objects designed to assist in debugging Frame Relay
            Interfaces from RFC 1315."                 m"The objects necessary to control a Frame Relay
            Interface's notification messages from RFC 1315."                     "The compliance statement "   L"This optional group is used for debugging Frame Relay
            Systems." r"This optional group is used for the management of
            asynchronous notifications by Frame Relay Systems." j"This optional group defines the asynchronous
            notifications generated by Frame Relay Systems." 4"Row creation is not required for the frDlcmiTable." 6"Row creation is not required for the frCircuitTable."             T"The compliance statement for objects and the trap
            defined in RFC 1315."   L"This optional group is used for debugging Frame Relay
            Systems." r"This optional group is used for the management of
            asynchronous notifications by Frame Relay Systems." j"This optional group defines the asynchronous
            notifications generated by Frame Relay Systems."                