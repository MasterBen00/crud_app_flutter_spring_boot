package com.example.crud.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

public enum Priority {
	UNDEFINED(-1),
	LOW(1),
	MEDIUM(2),
	HIGH(3);

	private final int value;

	Priority(int value) {
		this.value = value;
	}

	@JsonValue
	public int getValue() {
		return value;
	}

	@JsonCreator
	public static Priority fromString(String str) {
		try {
			return forValue(Integer.parseInt(str));
		} catch (Exception e) {
			return UNDEFINED;
		}
	}

	private static Priority forValue(int value) {
		switch (value) {
			case 1:
				return LOW;
			case 2:
				return MEDIUM;
			case 3:
				return HIGH;
			default:
				return UNDEFINED;
		}
	}

	public String getValueAsString() {
		return Integer.toString(this.value);
	}
}
