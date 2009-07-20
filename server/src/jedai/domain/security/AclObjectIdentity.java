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

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * AclObjectIdentity generated by hbm2java
 */
@Entity
@Table(name = "acl_object_identity", uniqueConstraints = @UniqueConstraint(columnNames = {
		"object_id_class", "object_id_identity" }))
public class AclObjectIdentity implements java.io.Serializable {

	private Long id;
	private AclObjectIdentity aclObjectIdentity;
	private AclClass aclClass;
	private AclSid aclSid;
	private long objectIdIdentity;
	private boolean entriesInheriting;
	private Set<AclObjectIdentity> aclObjectIdentities = new HashSet<AclObjectIdentity>(
			0);
	private Set<AclEntry> aclEntries = new HashSet<AclEntry>(0);

	public AclObjectIdentity() {
	}

	public AclObjectIdentity(AclClass aclClass, long objectIdIdentity,
			boolean entriesInheriting) {
		this.aclClass = aclClass;
		this.objectIdIdentity = objectIdIdentity;
		this.entriesInheriting = entriesInheriting;
	}

	public AclObjectIdentity(AclObjectIdentity aclObjectIdentity,
			AclClass aclClass, AclSid aclSid, long objectIdIdentity,
			boolean entriesInheriting,
			Set<AclObjectIdentity> aclObjectIdentities, Set<AclEntry> aclEntries) {
		this.aclObjectIdentity = aclObjectIdentity;
		this.aclClass = aclClass;
		this.aclSid = aclSid;
		this.objectIdIdentity = objectIdIdentity;
		this.entriesInheriting = entriesInheriting;
		this.aclObjectIdentities = aclObjectIdentities;
		this.aclEntries = aclEntries;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_OBJECT")
	public AclObjectIdentity getAclObjectIdentity() {
		return this.aclObjectIdentity;
	}

	public void setAclObjectIdentity(AclObjectIdentity aclObjectIdentity) {
		this.aclObjectIdentity = aclObjectIdentity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OBJECT_ID_CLASS", nullable = false)
	public AclClass getAclClass() {
		return this.aclClass;
	}

	public void setAclClass(AclClass aclClass) {
		this.aclClass = aclClass;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OWNER_SID")
	public AclSid getAclSid() {
		return this.aclSid;
	}

	public void setAclSid(AclSid aclSid) {
		this.aclSid = aclSid;
	}

	@Column(name = "OBJECT_ID_IDENTITY", nullable = false)
	public long getObjectIdIdentity() {
		return this.objectIdIdentity;
	}

	public void setObjectIdIdentity(long objectIdIdentity) {
		this.objectIdIdentity = objectIdIdentity;
	}

	@Column(name = "ENTRIES_INHERITING", nullable = false)
	public boolean isEntriesInheriting() {
		return this.entriesInheriting;
	}

	public void setEntriesInheriting(boolean entriesInheriting) {
		this.entriesInheriting = entriesInheriting;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "aclObjectIdentity")
	public Set<AclObjectIdentity> getAclObjectIdentities() {
		return this.aclObjectIdentities;
	}

	public void setAclObjectIdentities(
			Set<AclObjectIdentity> aclObjectIdentities) {
		this.aclObjectIdentities = aclObjectIdentities;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "aclObjectIdentity")
	public Set<AclEntry> getAclEntries() {
		return this.aclEntries;
	}

	public void setAclEntries(Set<AclEntry> aclEntries) {
		this.aclEntries = aclEntries;
	}

}