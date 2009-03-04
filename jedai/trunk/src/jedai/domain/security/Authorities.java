package jedai.domain.security;

/*
 * Jedai Networking Framework - http://jedai.googlecode.com
 * 
 * Copyright (c) 2006-2009 by respective authors (see below). All rights reserved.
 * 
 * This library is free software; you can redistribute it and/or modify it under the 
 * terms of the GNU Lesser General Public License as published by the Free Software 
 * Foundation; either version 2.1 of the License, or (at your option) any later 
 * version. 
 * 
 * This library is distributed in the hope that it will be useful, but WITHOUT ANY 
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License along 
 * with this library; if not, write to the Free Software Foundation, Inc., 
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 
 */

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Authorities generated by hbm2java
 */
@Entity
@Table(name = "authorities", uniqueConstraints = @UniqueConstraint(columnNames = {
		"username", "authority" }))
public class Authorities implements java.io.Serializable {

	private AuthoritiesId id;

	public Authorities() {
	}

	public Authorities(AuthoritiesId id) {
		this.id = id;
	}

	@EmbeddedId
	@AttributeOverrides( {
			@AttributeOverride(name = "username", column = @Column(name = "username", nullable = false, length = 50)),
			@AttributeOverride(name = "authority", column = @Column(name = "authority", nullable = false, length = 50)) })
	public AuthoritiesId getId() {
		return this.id;
	}

	public void setId(AuthoritiesId id) {
		this.id = id;
	}

}
