package UniqueIdentitySystem.DAO;

public class RegisterDAO {

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String execute() {
		return StatusConstants.SUCCESS;
	}
}
