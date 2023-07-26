package ru.croc.transactions.domain;

import ru.croc.ctp.jxfw.core.domain.meta.XFWElementLabel;
import ru.croc.ctp.jxfw.core.domain.meta.XFWEnumId;
import ru.croc.ctp.jxfw.core.generator.meta.XFWEnum;

@XFWEnum
public enum ContributionStatus {
    @XFWElementLabel("Request created")
    @XFWEnumId(1)
    CREATED,

    @XFWElementLabel("Request approved")
    @XFWEnumId(2)
    APPROVED,

    @XFWElementLabel("Request declined")
    @XFWEnumId(3)
    DECLINED,

    @XFWElementLabel("Request deleted")
    @XFWEnumId(4)
    DELETED
}
