package ru.croc.transactions_service.domain

import ru.croc.ctp.jxfw.core.generator.meta.XFWEnum
import ru.croc.ctp.jxfw.core.domain.meta.XFWEnumId


@XFWEnum
public enum ContributionStatus {

    /**
     * Request created.
     */
    @XFWEnumId(1)
    CREATED,

    /**
     * Request accepted
     */
    @XFWEnumId(2)
    APPROVED,

    /**
     * Запрос отклонен.
     */
    @XFWEnumId(3)
    DECLINED,

    /**
    * Request deleted.
    */
    @XFWEnumId(4)
    DELETED
}
