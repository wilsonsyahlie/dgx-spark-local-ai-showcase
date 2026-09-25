# Making a private browser usable from another view

A personal dashboard showed one persistent browser. Its safety rule allowed only one input controller, but it also made switching devices awkward: a newly opened view waited until the old view was manually disconnected.

The change kept the single browser and single input owner. The newest authorized view takes over only after the previous transport has released any held keyboard or pointer input. The displaced view stops retrying, so two open dashboards do not repeatedly steal control from each other. It can reclaim control deliberately. Closing the browser remains a different, global action.

Testing found two ordering bugs in the handoff signal. A viewer library replaced a close handler, and a generic cleanup path later replaced the intended close reason. Both were corrected before activation. Isolated native-browser checks covered switching, switching back, refresh, retained helper state, close behavior and narrow layouts. A separate race check covered two views requesting control before either connection was established.

The live browser returned after activation, but restarting it left its helper stopped by design. A second live viewer was not attached during the acceptance check because that would have displaced the owner's active view. Thus the fixture demonstrates the two-view interaction; the live check demonstrates deployment and recovery, not a real-device handoff. This solution does not offer simultaneous control, and it does not automate game actions. The broader lesson is to separate *where a view opens* from *who owns input*, then test the transition itself rather than only the eventual connected screen.
