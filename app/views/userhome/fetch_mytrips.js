<% if (trip_passengers_list.length != 0) %>
	<% for item in trip_passengers_list %>
		$("#as_passenger_feed").prepend('<%=j render(item) %>');
	<% end %>
<% end %>

<% if (trip_drivers_list.length != 0) %>
	<% for item in trip_drivers_list %>
		$("#as_driver_feed").prepend('<%=j render(item) %>');
	<% end %>
<% end %>

