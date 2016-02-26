package com.tq.requisition.presentation.dto.share;

import java.util.UUID;

public class AddressDto {
	/**
	 * πù¸cid
	 */
	private UUID id;

	/** ∏∏id */
	private UUID pid;

	/**
	 * πù¸cname
	 */
	private String name;


	/* getters and setters */
	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UUID getPid() {
		return pid;
	}

	public void setPid(UUID pid) {
		this.pid = pid;
	}

	/* constructors */
	public AddressDto() {
	}

	public AddressDto(UUID id, String name,UUID pid) {
		super();
		this.id = id;
		this.name = name;
		this.pid = pid;
	}

	/* public methods */
	public static AddressDto obtain(String title, UUID id,UUID pid) {
		return new AddressDto(id, title,pid);
	}
}
