package com.example.crud.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

public enum Status {
	UNDEFINED(-1),
	INCOMPLETE(0),
	COMPLETE(1);

	private final int value;

	Status(int value) {
		this.value = value;
	}

	@JsonValue
	public int getValue() {
		return value;
	}

	@JsonCreator
	public static Status fromString(String str) {
		try {
			return forValue(Integer.parseInt(str));
		} catch (Exception e) {
			return UNDEFINED;
		}
	}

	private static Status forValue(int value) {
		switch (value) {
			case 0:
				return INCOMPLETE;
			case 1:
				return COMPLETE;
			default:
				return UNDEFINED;
		}
	}

	public String getValueAsString() {
		return Integer.toString(this.value);
	}
}
