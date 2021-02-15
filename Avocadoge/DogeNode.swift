//
//  DogeNode.swift
//  Avocadoge
//
//  Created by Thomas Rademaker on 2/15/21.
//

import ClusterMembership
import SWIM
import NIO
import Logging

struct DogeNode {
    let port: Int
    var settings: SWIMNIO.Settings

    let group: EventLoopGroup

    init(port: Int, settings: SWIMNIO.Settings, group: EventLoopGroup) {
        self.port = port
        self.settings = settings
        self.group = group
    }

    func start() {
        let bootstrap = DatagramBootstrap(group: group)
            .channelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
            .channelInitializer { channel in
                return channel.pipeline
                    .addHandler(SWIMNIOHandler(settings: self.settings)).flatMap {
                        channel.pipeline.addHandler(DogeNodeHandler())
                    }
            }

        bootstrap.bind(host: "127.0.0.1", port: port).whenComplete { result in
            switch result {
            case .success(let res):
                self.settings.logger.info("Bound to: \(res)")
                ()
            case .failure(let error):
                self.settings.logger.error("Error: \(error)")
                ()
            }
        }
    }

}

final class DogeNodeHandler: ChannelInboundHandler {
    public typealias InboundIn = SWIM.MemberStatusChangedEvent

    let log = Logger(label: "SWIMNIOSample")

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let change: SWIM.MemberStatusChangedEvent = self.unwrapInboundIn(data)

        // we log each event (in a pretty way)
        self.log.info("Membership status changed: [\(change.member.node)] is now [\(change.status)]", metadata: [
            "swim/member": "\(change.member.node)",
            "swim/member/previousStatus": "\(change.previousStatus.map({"\($0)"}) ?? "unknown")",
            "swim/member/status": "\(change.status)",
        ])
    }
}
