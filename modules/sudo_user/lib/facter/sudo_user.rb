
# Return the current user, that runs the sudo command
Facter.add(:sudo_user) do
	  setcode do
		%x(getent passwd "$SUDO_USER" | cut -d: -f6)
	  end
end
